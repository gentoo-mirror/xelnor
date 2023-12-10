# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="Selection of Fankael fonts"
HOMEPAGE=""
SRC_URI="
https://dl.dafont.com/dl/?f=bigtime -> ${P}_bigtime.zip
https://dl.dafont.com/dl/?f=coraline_s_cat -> ${P}_coraline_s_cat.zip
https://dl.dafont.com/dl/?f=demonstration -> ${P}_demonstration.zip
https://dl.dafont.com/dl/?f=harry_p -> ${P}_harry_p.zip
https://dl.dafont.com/dl/?f=heart_4 -> ${P}_heart_4.zip
https://dl.dafont.com/dl/?f=little_lord_fontleroy -> ${P}_little_lord_fontleroy.zip
https://dl.dafont.com/dl/?f=magic_sparkle -> ${P}_magic_sparkle.zip
https://dl.dafont.com/dl/?f=magical -> ${P}_magical.zip
https://dl.dafont.com/dl/?f=memory_4 -> ${P}_memory_4.zip
https://dl.dafont.com/dl/?f=real_magic -> ${P}_real_magic.zip
https://dl.dafont.com/dl/?f=ringbearer -> ${P}_ringbearer.zip
https://dl.dafont.com/dl/?f=seriously_2 -> ${P}_seriously_2.zip
https://dl.dafont.com/dl/?f=timeless -> ${P}_timeless.zip
https://dl.dafont.com/dl/?f=young_frankenstein -> ${P}_young_frankenstein.zip
"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"

FONT_SUFFIX="ttf otf"
#FONT_CONF=( "${FILESDIR}/66-${PN}.conf" )

#pkg_nofetch() {
#	einfo "Please download the ${SRC_URI} from"
#	einfo "${DOWNLOAD_URL}"
#	einfo "and place it in ${DISTDIR}"
#}

src_unpack() {
	default
	mkdir "${WORKDIR}/${P}"
	mv *.otf *.ttf "${WORKDIR}/${P}"
	for f in *.TTF; do
		mv $f "${WORKDIR}/${P}/${f%.TTF}.ttf"
	done
}
