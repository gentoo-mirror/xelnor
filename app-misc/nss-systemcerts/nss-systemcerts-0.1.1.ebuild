# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit vcs-snapshot

DESCRIPTION="Synchronise /etc/ssl/certs and a system-wide NSS certificate db"
HOMEPAGE="https://github.com/rbarrois/nss-systemcerts"
SRC_URI="https://github.com/rbarrois/${PN}/tarball/${P} -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/nss[utils] app-misc/ca-certificates"
DEPEND=""

src_install()
{
	dodoc README
	dosbin nss-systemcerts-import
	dosbin nss-systemcerts-hook
}

pkg_postinst()
{
	elog "In order to setup your system-wide NSS database, please run the "
	elog "nss-systemcerts-import command."
	elog "If you wish to update your NSS database automatically whenever "
	elog "app-misc/ca-certificates is updated, or /etc/ca-certificates.conf is "
	elog "updated, add nss-systemcerts-hook to /etc/ca-certificates/update.d: "
	elog "ln -s /usr/sbin/nss-systemcerts-hook /etc/ca-certificates/update.d/"
}
