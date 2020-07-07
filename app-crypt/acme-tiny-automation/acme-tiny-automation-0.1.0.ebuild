# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..8} )
inherit python-any-r1

DESCRIPTION="	A set of tools to automate acme-tiny, in a simple, low-config way."
HOMEPAGE="https://git.xelnor.net/?p=acme-tiny-automation.git"
SRC_URI="https://dist.xelnor.net/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nginx apache"
REQUIRED_USE="^^ ( nginx apache )"

BDEPEND="${PYTHON_DEPS}"
DEPEND=""
RDEPEND="app-crypt/acme-tiny
acct-user/acme
acct-group/acme
apache? ( acct-group/apache )"

src_configure() {
	if use apache; then
		WWW_GROUP=apache
	fi
	if use nginx; then
		WWW_GROUP=nginx
	fi

	econf --acme-user acme --acme-group acme --www-group ${WWW_GROUP}
}

src_install() {
	default
	keepdir /var/lib/www/acme-challenge
}
