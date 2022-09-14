# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )

inherit distutils-r1

DESCRIPTION="Python wrapper around low-level FS-related calls"
HOMEPAGE="https://github.com/rbarrois/fslib
http://pypi.python.org/pypi/fslib"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}"

python_test() {
	"${PYTHON}" setup.py test || die
}
