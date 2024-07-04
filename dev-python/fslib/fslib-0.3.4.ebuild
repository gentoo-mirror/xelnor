# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DISTUTILS_USE_PEP517="setuptools"
PYTHON_COMPAT=( python3_{8..12} )

inherit distutils-r1 pypi

DESCRIPTION="Python wrapper around low-level FS-related calls"
HOMEPAGE="https://github.com/rbarrois/fslib
http://pypi.python.org/pypi/fslib"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}"

python_test() {
	"${PYTHON}" setup.py test || die
}
