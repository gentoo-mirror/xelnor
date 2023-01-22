# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..11} )

NODEJS_DEPS_ONLY=1

inherit distutils-r1 xel-nodejs

DESCRIPTION="Django-based registration for crosstriangulaire.com."
HOMEPAGE="http://git.xelnor.net/crossix.git"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz
https://registry.npmjs.org/jquery/-/jquery-2.1.4.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=dev-python/django-2.2[${PYTHON_USEDEP}]
	>=dev-python/getconf-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/django-sendfile2-0.6.0[${PYTHON_USEDEP}]
	dev-python/markdown[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-nodejs/webpack"

src_unpack() {
	unpack ${P}.tar.gz
	xel-nodejs_src_unpack
}

python_prepare_all() {
	enpm install --only=production --no-optional
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

	keepdir /var/lib/crossix
	keepdir /var/tmp/crossix
}
