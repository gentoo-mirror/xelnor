# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )

inherit distutils-r1

DESCRIPTION="Manage Kconfig-based configuration files"
HOMEPAGE="https://pypi.org/project/kconfgen https://github.com/rbarrois/kconfgen"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
dev-python/kconfiglib[${PYTHON_USEDEP}]
dev-python/toml[${PYTHON_USEDEP}]"
DEPEND="test? (
		dev-python/tox
		dev-python/flake8
		dev-python/mypy
	)
"
BDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

python_test() {
	make test || die
}
