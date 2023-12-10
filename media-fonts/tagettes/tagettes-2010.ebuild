# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="Tagettes Font"
HOMEPAGE="http://www.pia-frauss.de/fonts/tg.htm"
SRC_URI="http://www.pia-frauss.de/fonts/Tagettes.zip"

LICENSE="PiaFrauss-PUA"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

#RESTRICT="fetch"

FONT_SUFFIX="ttf"
FONT_CONF=( "${FILESDIR}/66-${PN}.conf" )

#pkg_nofetch() {
#	einfo "Please download the ${SRC_URI} from"
#	einfo "${DOWNLOAD_URL}"
#	einfo "and place it in ${DISTDIR}"
#}

src_unpack() {
	default
	mkdir "${WORKDIR}/${P}"
	mv Tagettes.txt *.ttf "${WORKDIR}/${P}"
}
