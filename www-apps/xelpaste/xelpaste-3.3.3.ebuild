# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

PYTHON_COMPAT=( python3_{8..11} )

NODEJS_DEPS_ONLY=1

inherit distutils-r1 xel-nodejs

DESCRIPTION="Django-based pastebin with image support."
HOMEPAGE="https://github.com/rbarrois/xelpaste"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz
https://registry.npmjs.org/bootstrap/-/bootstrap-3.3.7.tgz
https://registry.npmjs.org/jquery/-/jquery-2.1.4.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=dev-python/django-4.0[${PYTHON_USEDEP}]
	>=dev-python/getconf-1.3.0[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	>=dev-python/django-appconf-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/django-sendfile2-0.7.0[${PYTHON_USEDEP}]
	>=dev-python/django-mptt-0.7.4[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-nodejs/webpack"

src_unpack() {
	unpack ${P}.tar.gz
	xel-nodejs_src_unpack
	cat "${S}/package.json" | python -c 'import json, sys; data=json.load(sys.stdin); data["devDependencies"]={}; json.dump(data, sys.stdout)' > "${S}/package-nodev.json"
	mv "${S}/package-nodev.json" "${S}/package.json"
}

python_prepare_all() {
	mkdir node_modules;
	for pkg in bootstrap jquery; do
		(cd node_modules; tar --transform="s,^package/,${pkg}/," -xzf ../registry/${pkg}*)
	done

	touch package-lock.json
	distutils-r1_python_prepare_all
}

python_compile() {
	emake build
	distutils-r1_python_compile
}

src_install() {
	distutils-r1_src_install

	insinto /etc/xelpaste
	newins "${FILESDIR}/xelpaste.ini" 00_base.ini

	insinto /etc/cron.daily
	newins "${FILESDIR}/xelpaste.cron.daily" xelpaste_cleanup

	keepdir /var/lib/xelpaste
	keepdir /var/tmp/xelpaste
}
