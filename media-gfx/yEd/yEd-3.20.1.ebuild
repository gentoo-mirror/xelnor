# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit java-pkg-2 desktop

DESCRIPTION="Ed Graph Editor - High-quality diagrams made easy"
HOMEPAGE="http://www.yworks.com/products/yed"
SRC_URI="https://www.yworks.com/resources/yed/demo/${P}.zip"
DOWNLOAD_URL="https://www.yworks.com/downloads#yEd"

LICENSE="yEd"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="fetch"

DEPEND=""
RDEPEND="${DEPEND}
>=virtual/jre-1.8"
BDEPEND=""

pkg_nofetch() {
	einfo "Please download the ${SRC_URI} from"
	einfo "${DOWNLOAD_URL}"
	einfo "and place it in ${DISTDIR}"
}

src_unpack() {
	default
	mv "yed-${PV}" "${S}"
}

src_install() {
	java-pkg_dojar lib/*
	java-pkg_dojar "${PN,,}.jar"

	for size in 16 24 32 48 64 128; do
		newicon --size $size "icons/yed${size}.png" yed.png
	done
	make_desktop_entry ${PN} "yEd Graph Editor" yed "Graphics;2DGraphics"

	dodoc license.html
	dodoc thirdpartylicenses.html

	java-pkg_dolauncher yEd --jar "${PN,,}.jar"
}
