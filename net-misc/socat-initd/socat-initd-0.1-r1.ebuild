# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

inherit eutils

DESCRIPTION="Init.d script for socat"
HOMEPAGE="http://www.dest-unreach.org/socat/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~s390 ~sparc ~x86"

DEPEND="net-misc/socat"
RDEPEND="${DEPEND}"

src_install() {
	doinitd "${FILESDIR}"/socat
	dodir /etc/socat
	insinto /etc/socat
	doins "${FILESDIR}"/socat.conf.example

	keepdir /var/run/socat
}
