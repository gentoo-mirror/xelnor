# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="A tool to tunnel tcp data over DNS queries"
HOMEPAGE="http://www.hsc.fr/ressources/outils/dns2tcp/index.html.en"
SRC_URI="http://www.hsc.fr/ressources/outils/dns2tcp/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"

	newinitd "${FILESDIR}"/init dns2tcpd
	newconfd "${FILESDIR}"/conf dns2tcpd
	cp "${FILESDIR}"/dns2tcpd.conf "${D}"/etc/dns2tcpd.conf
}
