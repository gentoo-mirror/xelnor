inherit eutils

DESCRIPTION="Tools for postfix"
HOMEPAGE="http://pfixtools.mymind.fr"
SRC_URI="http://pfixtools.org/trac/raw-attachment/wiki/Download/${P}.tar.gz"

LICENSE="|| ( BSD )"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
DEPEND="mail-filter/libsrs2
        dev-libs/libev
		net-dns/unbound
		sys-libs/tokyocabinet
		dev-util/gperf"
# deps for documentation (future)
#		app-text/xmlto
#		app-text/asciidoc"

src_unpack() {
	unpack ${A}
	cd "${PN}"
	epatch "${FILESDIR}/${PF}.install.patch"
}

src_compile() {
	cd "${PN}"
	emake DESTDIR="${D}" prefix=/usr all || die
}

src_install() {
	cd "${PN}"
	emake DESTDIR="${D}" prefix=/usr install || die
}
