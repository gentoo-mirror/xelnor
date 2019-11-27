# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="LuxTrust middleware"
HOMEPAGE="https://www.luxtrust.lu/en/article/672"
SRC_URI="https://www.luxtrust.lu/downloads/middleware/LuxTrust_Middleware_1.2.1_Debian_64bit.tar.gz -> ${P}.tar.gz"

LICENSE="luxtrust"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
BDEPEND=""
RDEPEND="sys-apps/pcsc-lite
dev-libs/pkcs11-helper"

src_unpack() {
	unpack "${A}"
	mkdir -p "${S}"
	ar p Gemalto_Middleware_Debian_64bit_*.deb data.tar.xz | tar xJO ./usr/lib/ClassicClient/libgclib-1.8.0.so > ${S}/libgclib-1.8.0.so
}

src_compile() {
	:;
}

src_install() {
	dolib.so libgclib-1.8.0.so
}
