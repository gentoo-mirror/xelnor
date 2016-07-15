# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4

inherit eutils vcs-snapshot

DESCRIPTION="Tools for postfix"
HOMEPAGE="http://pfixtools.mymind.fr"
SRC_URI="https://github.com/Fruneau/${PN}/archive/${P}.tar.gz
https://github.com/Fruneau/libcommon/archive/bad528f60f6371f692d845c0590fc50a9a74006b.tar.gz -> ${P}-libcommon.tar.gz"

LICENSE="|| ( BSD )"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"
DEPEND="mail-filter/libsrs2
		dev-libs/libev
		net-dns/unbound
		dev-db/tokyocabinet
		dev-util/gperf
		doc? ( app-text/xmlto app-text/asciidoc )"

src_prepare() {
	rmdir "${WORKDIR}/${P}/common"
	ln -s "../${P}-libcommon" "${WORKDIR}/${P}/common"
	cd "${WORKDIR}/${P}"
	epatch "${FILESDIR}/${PF}.install-doc.patch"
}

src_compile() {
	cd "${WORKDIR}/${P}"
	emake DESTDIR="${D}" prefix=/usr all || die
	if use doc
	then
		emake DESTDIR="${D}" prefix=/usr doc || die
	fi
}

src_install() {
	cd "${WORKDIR}/${P}"
	emake -j1 DESTDIR="${D}" prefix=/usr install || die
	if use doc
	then
		emake DESTDIR="${D}" prefix=/usr install-doc || die
	fi
	newinitd "${FILESDIR}"/postlicyd-initd postlicyd
	dodir /var/run/postlicyd
	dodir /var/spool/postlicyd
}
