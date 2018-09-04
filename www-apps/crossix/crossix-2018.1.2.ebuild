# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_4 python3_5 python3_6 )

inherit distutils-r1

DESCRIPTION="Django-based registration for crosstriangulaire.com."
HOMEPAGE="http://git.xelnor.net/crossix.git"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=dev-python/django-2.0[${PYTHON_USEDEP}]
	>=dev-python/getconf-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/django-sendfile-0.3.9[${PYTHON_USEDEP}]
	dev-python/markdown[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	net-libs/nodejs"

python_prepare_all() {
	emake update-js
	distutils-r1_python_prepare_all
}

python_compile() {
	emake build
	distutils-r1_python_compile
}

src_install() {
	distutils-r1_src_install

	insinto /etc/crossix
	newins "${FILESDIR}/crossix.ini" 00_base.ini

	dodir /var/lib/crossix
	dodir /var/tmp/crossix
}
