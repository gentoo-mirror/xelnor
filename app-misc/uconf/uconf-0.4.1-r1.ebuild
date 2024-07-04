# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DISTUTILS_USE_PEP517="setuptools"
PYTHON_COMPAT=( python3_{8..12} )

inherit distutils-r1 pypi

DESCRIPTION="An efficient configuration file manager"
HOMEPAGE="http://uconf.xelnor.net/ http://pypi.python.org/pypi/uconf"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}
	dev-python/tdparser[${PYTHON_USEDEP}]
	>=dev-python/fslib-0.3.4[${PYTHON_USEDEP}]
	>=dev-python/confutils-0.3.2[${PYTHON_USEDEP}]"
