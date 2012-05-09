# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

EGIT_REPO_URI="git://github.com/rezosup/solidircd.git"
EGIT_BRANCH="fhs-layout"
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

src_compile() {
	local myconf
	if use ssl ; then
		myconf="${myconf} --enable-openssl"
	else
		myconf="${myconf} --disable-openssl"
	fi
	econf ${myconf} || die "configure failed"

	emake || die "make failed"
}

pkg_setup() {
	enewgroup ircd
	enewuser ircd -1 -1 /var/run/ircd ircd
}

src_install() {
	dodoc doc/*.txt

	emake INSTALL_DIR="${WORKDIR}/built/" install || die "emake failed"

	dodir /var/run/ircd
	fowners ircd:ircd /var/run/ircd

	cd "${WORKDIR}/built"

	doinitd ${FILESDIR}/ircd

	# Binaries
	dobin ircd
	newbin mkpasswd mkpasswd-ircd

	# Config
	keepdir etc/ircd
	insinto etc/ircd
	doins ircd.motd
	doins opers.txt
	newins reference.conf ircd.conf.default
	newins template.conf ircd.conf
}
