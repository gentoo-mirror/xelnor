# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_5 python3_6 python3_7 )

inherit distutils-r1

DESCRIPTION="Simple, configuration-driven backup software for servers and workstations"
HOMEPAGE="https://torsion.org/borgmatic/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="app-backup/borgbackup
>=dev-python/pykwalify-1.6.0[${PYTHON_USEDEP}]
>dev-python/ruamel-yaml-0.15.0[${PYTHON_USEDEP}]
dev-python/setuptools[${PYTHON_USEDEP}]
>=dev-python/colorama-0.4.1[${PYTHON_USEDEP}]"
BDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

DOCS=( README.md )
