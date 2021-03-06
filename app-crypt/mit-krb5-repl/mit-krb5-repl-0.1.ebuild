# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Replication tools for mit-krb5"
HOMEPAGE="http://overlay.xelnor.net"
SRC_URI="http://dist.xelnor.net/${P}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="master slave"

DEPEND="app-crypt/mit-krb5"
RDEPEND="${DEPEND}"

src_install() {
	if use master ; then
		emake DESTDIR="${D}" master || die "Install failed"
	fi
	if use slave ; then
		emake DESTDIR="${D}" slave || die "Install failed"
	fi
}
