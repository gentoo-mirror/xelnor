# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/stunnel/stunnel-4.27.ebuild,v 1.1 2009/04/30 21:45:38 patrick Exp $

inherit eutils

DESCRIPTION="Init.d script for socat"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sparc ~x86"

DEPEND="net-misc/socat"
RDEPEND="${DEPEND}"

src_install() {
	doinitd "${FILESDIR}"/socat
	dodir /etc/socat
	insinto /etc/socat
	doins "${FILESDIR}"/socat.conf.example

	keepdir /var/run/socat
}
