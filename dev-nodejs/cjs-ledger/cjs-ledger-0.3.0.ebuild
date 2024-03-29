# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Minimal, offline, CommonJS-compliant registry"
HOMEPAGE="https://github.com/rbarrois/cjs-ledger"
SRC_URI="https://dist.xelnor.net/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

PYTHON_COMPAT=( python3_{8..11} )

inherit python-single-r1

RDEPEND="${PYTHON_DEPS}
net-libs/nodejs"
BDEPEND="${PYTHON_DEPS}"
DEPEND=""
