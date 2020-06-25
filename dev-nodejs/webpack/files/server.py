#!/usr/bin/env python

import argparse
import http
import http.server
import json
import logging
import os
import pathlib
import pprint
import shutil
import socket
import sys
import urllib.parse
import typing as T


logger = logging.getLogger(__name__)


Package = T.NewType('Package', T.Text)
Version = T.NewType('Version', T.Text)
Archive = T.NewType('Archive', pathlib.Path)
Url = T.NewType('Url', T.Text)


Registry = T.Dict[Package, T.Dict[Version, Archive]]


def scan(path: pathlib.Path) -> Registry:
    registry: Registry = {}

    def register(filename: T.Text) -> None:
        raw_pkg, raw_ver = filename[:-4].rsplit('-', 1)
        package = Package(raw_pkg)
        version = Version(raw_ver)
        logger.info(
            "Adding package=%s version=%s path=%s...",
            package, version, filename,
        )
        registry.setdefault(package, {})[version] = Archive(pathlib.Path(filename))

    for entry in os.scandir(path):
        if entry.is_dir() and entry.name.startswith('@'):
            # Nested folder
            for subentry in os.scandir(path / entry.name):
                if subentry.is_file() and subentry.name.endswith('.tgz'):
                    register('{}/{}'.format(entry.name, subentry.name))
        elif entry.is_file() and entry.name.endswith('.tgz'):
            register(entry.name)
    return registry


class Server(http.server.ThreadingHTTPServer):
    def __init__(self, address: T.Text, port: int, repository: pathlib.Path, registry: Registry):
        if ':' in address:
            # IPv6
            self.address_family = socket.AF_INET6
            netloc = '[{}]:{}'.format(address, port)
        else:
            netloc = '{}:{}'.format(address, port)

        self.repository = repository
        self.registry = registry
        super().__init__((address, port), RequestHandler)

    @property
    def base_url(self) -> Url:
        return Url('http://{}:{}/'.format(self.server_name, self.server_port))


def urljoin(base: Url, *parts: T.Text) -> Url:
    filtered = [urllib.parse.quote(part, safe='@') for part in parts if part is not None]
    return Url(urllib.parse.urljoin(base, '/'.join(filtered)))


class RequestHandler(http.server.BaseHTTPRequestHandler):

    server: Server

    @property
    def registry(self) -> Registry:
        return self.server.registry

    @property
    def base_url(self) -> Url:
        return self.server.base_url

    @property
    def repository(self) -> pathlib.Path:
        return self.server.repository

    def do_GET(self) -> None:
        parts = self.path.lstrip('/').split('/')
        logger.info("Parts: %r", parts)

        package: T.Optional[Package] = None
        version: T.Optional[Version] = None
        archive: T.Optional[Archive] = None

        if len(parts) > 0:
            package = Package(urllib.parse.unquote(parts[0]))
            if package.count('/') > 1:
                return self.fail()
            elif package.count('/') == 1 and not package.startswith('@'):
                return self.fail()
            if package not in self.registry:
                return self.fail(http.HTTPStatus.NOT_FOUND)

        if len(parts) > 1:
            assert package is not None
            version = Version(urllib.parse.unquote(parts[1]))
            if version not in self.registry[package]:
                return self.fail(http.HTTPStatus.NOT_FOUND)

        if len(parts) > 2:
            raw_archive = urllib.parse.unquote(parts[2])
            if raw_archive != '{}-{}.tgz'.format(package, version):
                return self.fail()
            archive = Archive(pathlib.Path(raw_archive))

        if len(parts) > 3:
            return self.fail(http.HTTPStatus.NOT_FOUND)

        if archive is not None:
            # {registry root url}/{package name}/{package version}/{package name}-{package version}.tgz
            self.get_archive(archive)

        elif version is not None:
            assert package is not None
            # {registry root url}/{package name}/{package version}
            self.get_version(package, version)

        elif package is not None:
            # {registry root url}/{package name}
            self.get_package(package)

        else:
            # {registry root url}
            self.get_toplevel()

    def get_toplevel(self) -> None:
        self.json_response({
            name: urljoin(self.base_url, name)
            for name in self.registry
        })

    def get_package(self, name: Package) -> None:
        self.json_response({
            'name': name,
            'versions': {
                version: {
                    'name': name,
                    'version': version,
                    'dist': {'tarball': urljoin(self.base_url, name, version, str(tarball))}
                }
                for version, tarball in self.registry[name].items()
            },
        })

    def get_version(self, name: Package, version: Version) -> None:
        tarball = self.registry[name][version]
        self.json_response({
            'name': name,
            'version': version,
            'dist': {'tarball': urljoin(self.base_url, name, version, str(tarball))},
        })

    def get_archive(self, archive: Archive) -> None:
        path = self.repository / archive
        try:
            f = open(path, 'rb')
        except OSError:
            return self.fail(http.HTTPStatus.NOT_FOUND)
        self.binary_response(f)

    def json_response(self, data: T.Dict[T.Text, T.Any]) -> None:
        payload = json.dumps(data).encode('utf-8')
        self.send_response(http.HTTPStatus.OK)
        self.send_header('Content-Type', 'application/json')
        self.send_header('Content-Length', str(len(payload)))
        self.end_headers()
        self.wfile.write(payload)

    def binary_response(self, fileobj: T.IO[bytes]) -> None:
        fs = os.fstat(fileobj.fileno())
        self.send_response(http.HTTPStatus.OK)
        self.send_header('Content-Type', 'application/octet-stream')
        self.send_header('Content-Length', str(fs.st_size))
        self.end_headers()
        shutil.copyfileobj(fileobj, self.wfile)

    def fail(self, code: http.HTTPStatus = http.HTTPStatus.BAD_REQUEST) -> None:
        self.send_response(code)
        self.end_headers()


def run_forever(repository: pathlib.Path, address: T.Text, port: int, write_url: T.Optional[T.IO[str]] = None) -> None:
    registry = scan(repository)
    server = Server(
        repository=repository,
        registry=registry,
        address=address,
        port=port,
    )
    logger.info("Serving %d packages", len(registry))
    logger.info("Listening on %s", server.base_url)
    logger.info("PID=%d", os.getpid())
    if write_url:
        logger.info("Written base URL to '%s'", write_url.name)
        write_url.write(server.base_url)
        write_url.close()
    server.serve_forever()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        '--bind', default='localhost',
        help="Address to bind to, default=::1",
    )
    parser.add_argument(
        '--port', default=0, type=int,
        help="Port to listen on; 0 for a dynamically chosen free port.",
    )
    parser.add_argument(
        'repository', type=pathlib.Path,
        help="Directory containing archives to publish",
    )
    parser.add_argument(
        '--write-url', type=argparse.FileType('w'),
        help="File where the selected URL should be written",
    )

    args = parser.parse_args()

    logging.basicConfig(
        format="%(levelname)s: %(message)s",
        stream=sys.stderr,
        level=logging.INFO,
    )

    run_forever(
        repository=args.repository,
        address=args.bind,
        port=args.port,
        write_url=args.write_url,
    )

if __name__ == '__main__':
    main()
