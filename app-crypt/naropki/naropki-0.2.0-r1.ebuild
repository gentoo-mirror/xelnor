# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )
inherit python-any-r1

DESCRIPTION="Manage a PKI restricted to a few top-level domain names (e.g. *.example.org)"
HOMEPAGE="https://git.xelnor.net/?p=naropki.git"
SRC_URI="https://dist.xelnor.net/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

BDEPEND="${PYTHON_DEPS}"
DEPEND=""
RDEPEND="dev-libs/openssl"
