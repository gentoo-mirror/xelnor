# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5} pypy{1_9,2_0} )

inherit distutils-r1

DESCRIPTION="Python Env Wrapper is a pure python wrapper around virtualenv"
HOMEPAGE="https://crate.io/packages/pew/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/virtualenv[${PYTHON_USEDEP}]
	>=dev-python/virtualenv-clone-0.2.5[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/backports-shutil_get_terminal_size[${PYTHON_USEDEP}]' 'python2*')
	$(python_gen_cond_dep 'dev-python/backports-shutil_which[${PYTHON_USEDEP}]' 'python2*')"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
