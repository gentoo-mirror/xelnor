# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{8..12} )

inherit distutils-r1 pypi

DESCRIPTION="tool to manage multiple virtualenvs written in pure python"
HOMEPAGE="
	https://github.com/berdario/pew
	https://pypi.org/project/pew/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

DEPEND=">=dev-python/virtualenv-1.11.6[${PYTHON_USEDEP}]
	>=dev-python/virtualenv-clone-0.2.5[${PYTHON_USEDEP}]"
