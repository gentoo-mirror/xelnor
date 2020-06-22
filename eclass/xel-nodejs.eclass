# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: xel-nodejs.eclass
# @MAINTAINER:
# Raphaël Barrois (Xelnor) <raphael.barrois+gentoo@xelmail.com>
# @AUTHOR:
# Raphaël Barrois (Xelnor) <raphael.barrois+gentoo@xelmail.com>
# @BLURB: handle packages using npm/nodejs dependencies
# @DESCRIPTION:
# The xel-nodejs eclass is designed to allow easy management of nodejs-based
# dependencies within the Gentoo Linux system.
# Dependencies will be *bundled* with the package, akin to USE=static for
# binary code.


case ${EAPI:-0} in
	7)
		;;
	*)
		die "EAPI=${EAPI} is not supported by xel-nodejs.eclass"
		;;
esac


enpm() {
	cjs-ledger ${S}/registry --exec npm --cache=${WORKDIR}/.npm-cache --no-audit $* || die "Error running npm"
}

BDEPEND="dev-nodejs/cjs-ledger"

if [ "${NODEJS_DEPS_ONLY:-0}" = "1" ]; then
	EXPORT_FUNCTIONS src_unpack
else
	EXPORT_FUNCTIONS src_unpack src_compile src_install
fi

xel-nodejs_src_unpack() {
	mkdir --parents ${S}/registry
	for f in ${DISTDIR}/*.tgz; do
		ln --symbolic --verbose ${f} ${S}/registry/$(basename $f)
	done
}

xel-nodejs_src_compile() {
	enpm --cache ${WORKDIR}/.npm-cache install ${PN}@${PV}
}

xel-nodejs_src_install() {
	dodir /usr/lib/nodejs/${PN}
	cp -R "${S}/node_modules/" "${D}/usr/lib/nodejs/${PN}"
	cp "${S}/package-lock.json" "${D}/usr/lib/nodejs/${PN}/package.json"
}
