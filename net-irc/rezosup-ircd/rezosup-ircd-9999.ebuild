# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

EGIT_REPO_URI="git://github.com/rezosup/solidircd.git"
EGIT_BRANCH="debian-packaging"
inherit git-2 autotools eutils
SRC_URI=""

DESCRIPTION="Rezosup ircd"
HOMEPAGE="http://www.rezosup.org"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="ssl"

DEPEND="ssl? ( dev-libs/openssl )"
RDEPEND="${RDEPEND}"

src_unpack() {
	git-2_src_unpack
}

src_configure() {
	local myconf
	if use ssl ; then
		myconf="${myconf} --enable-openssl"
	else
		myconf="${myconf} --disable-openssl"
	fi
	econf ${myconf} || die "configure failed"
}

pkg_setup() {
	enewgroup ircd
	enewuser ircd -1 -1 /var/run/ircd ircd
}

src_install() {
	dodoc doc/*.txt

	emake DESTDIR="${D}" PACKAGE=${P} sysconfdir=/etc prefix=/usr exec_prefix=/usr install || die

	dodir /var/run/ircd
	fowners ircd:ircd /var/run/ircd
}
