# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit multilib

DESCRIPTION="Xelnet collection of Nagios plugins"
HOMEPAGE="https://github.com/alaskacommunications/nagios_check_drbd9 https://bucardo.org/check_postgres/"
SRC_URI="https://github.com/alaskacommunications/nagios_check_drbd9/releases/download/v0.3/nagios_check_drbd9-0.3.tar.xz
https://bucardo.org/downloads/check_postgres-2.24.0.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/perl"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	default
	mkdir "${WORKDIR}/${P}"
}

src_compile() {
	cp $(find "${WORKDIR}/" -name "check_*.pl" -type f) "${WORKDIR}/${P}"
	sed -i 's!/usr/sbin/drbd!/sbin/drbd!' "${WORKDIR}/${P}/check_drbd9.pl"
}

src_install() {
	exeinto /usr/$(get_libdir)/nagios/plugins/xelnet
	doexe "check_postgres.pl"
	doexe "check_drbd9.pl"
}
