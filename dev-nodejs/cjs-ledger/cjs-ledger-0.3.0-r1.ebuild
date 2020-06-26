# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_7 python3_8 )
inherit python-single-r1

DESCRIPTION="Minimal, offline, CommonJS-compliant registry"
HOMEPAGE="https://github.com/rbarrois/cjs-ledger"
SRC_URI="https://dist.xelnor.net/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
net-libs/nodejs"
BDEPEND="${PYTHON_DEPS}"
DEPEND=""

src_install() {
	default
	python_fix_shebang "${D}"/usr/bin/cjs-ledger
	python_fix_shebang "${D}"/usr/bin/cjs-manifest
}
