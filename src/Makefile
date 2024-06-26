# add path to tcl_cruncher if installed
#TCL_CRUNCHER = ./tcl_cruncher
FREE_WRAP = ../../freewrap
TCL_DOC = ../../tcldoc-0.85/tcldoc.tcl
# uncomment next line if no tcl_cruncher installed
TCL_CRUNCHER = cat
#-----------------------------------------------------------------------
GE_SOURCES = adjgeo.tcl animate.tcl arcgeo.tcl calcgeo.tcl com_easy.tcl \
	dtmgeo.tcl dxfgeo.tcl gamaxml.tcl gc3.tcl geodimet.tcl graphgeo.tcl \
	grid.tcl foif.tcl helpgeo.tcl icons.tcl idex.tcl lbgeo.tcl leica.tcl \
	loadgeo.tcl maskgeo.tcl nikon.tcl profigeo.tcl proj.tcl reggeo.tcl \
	sdr.tcl sokkia.tcl survce.tcl topcon.tcl trackmaker.tcl transgeo.tcl \
	travgeo.tcl trimble.tcl xmlgeo.tcl zsenigeo.tcl sqlgeo.tcl \
	geo_easy.tcl
CE_SOURCES = com_easy.tcl helpgeo.tcl maincom_easy.tcl
#
# tcldoc cannot process gamaxml.tcl, it is removed from doc sources :(
DOC_SOURCES = adjgeo.tcl animate.tcl arcgeo.tcl calcgeo.tcl com_easy.tcl \
	dtmgeo.tcl dxfgeo.tcl gc3.tcl geodimet.tcl graphgeo.tcl \
	grid.tcl foif.tcl helpgeo.tcl icons.tcl idex.tcl lbgeo.tcl leica.tcl \
	loadgeo.tcl maskgeo.tcl nikon.tcl profigeo.tcl proj.tcl reggeo.tcl \
	sdr.tcl sokkia.tcl survce.tcl topcon.tcl trackmaker.tcl transgeo.tcl \
	travgeo.tcl trimble.tcl xmlgeo.tcl zsenigeo.tcl sqlgeo.tcl \
	geo_easy.tcl
#
# files for debian package
DEB_FILES = ${GE_SOURCES} ${CE_SOURCES} tclIndex \
	./com_set geo_easy.msk default.msk build_date.tcl ./demodata \
	./i18n ./tsdata sources.tcl

DEBBASE_PATH = "../deb"
DEB_PATH = "${DEBBASE_PATH}/geoeasy"
DEBDOC_PATH = "${DEBBASE_PATH}/geoeasy-doc"
OSDISTNAME = `lsb_release -c -s`
VERSION = `grep 'set version ' geo_easy.tcl | grep -o [0-9]* | sed -e 's/./&./g;s/\.$$//'`

EXTERNAL_CS2CS = `command -v cs2cs`
EXTERNAL_GAMMALOCAL = `command -v gama-local`
EXTERNAL_TRIANGLE = `command -v triangle`

all: gizi.ico GeoEasy GeoEasy.exe GeoEasy64.exe ComEasy ComEasy.exe ComEasy64.exe linux 

GeoEasy: GeoEasy.tcl
# check message files
	cd i18n && ./msg_check.sh
# new freewrap package
	$(FREE_WRAP)/linux64/freewrap GeoEasy.tcl -forcewrap -o GeoEasy
GeoEasy.exe: GeoEasy.tcl
	$(FREE_WRAP)/linux64/freewrap GeoEasy.tcl -w $(FREE_WRAP)/win32/freewrap.exe -i gizi.ico -forcewrap -o GeoEasy.exe
GeoEasy64.exe: GeoEasy.tcl
	$(FREE_WRAP)/linux64/freewrap GeoEasy.tcl -w $(FREE_WRAP)/win64/freewrap.exe -i gizi.ico -forcewrap -o GeoEasy64.exe

gizi.ico: geoeasy_ico.png
	convert geoeasy_ico.png -alpha off -resize 128x128 geoeasy_ico_128_24.png
	convert geoeasy_ico.png -alpha off -resize 48x48 geoeasy_ico_48_24.png
	convert geoeasy_ico.png -alpha off -resize 48x48 -colors 256 geoeasy_ico_48_8.png
	convert geoeasy_ico.png -alpha off -resize 48x48 -colors 16 geoeasy_ico_48_4.png
	convert geoeasy_ico.png -alpha off -resize 32x32 geoeasy_ico_32_24.png
	convert geoeasy_ico.png -alpha off -resize 32x32 -colors 256 geoeasy_ico_32_8.png
	convert geoeasy_ico.png -alpha off -resize 32x32 -colors 16 geoeasy_ico_32_4.png
	convert geoeasy_ico.png -alpha off -resize 16x16 -colors 256 geoeasy_ico_16_8.png
	convert geoeasy_ico.png -alpha off -resize 16x16 -colors 16 geoeasy_ico_16_4.png
	convert geoeasy_ico_16_4.png geoeasy_ico_16_8.png geoeasy_ico_32_4.png geoeasy_ico_32_8.png geoeasy_ico_32_24.png geoeasy_ico_48_4.png geoeasy_ico_48_8.png geoeasy_ico_48_24.png geoeasy_ico_128_24.png gizi.ico
	rm geoeasy_ico_128_24.png geoeasy_ico_48_24.png geoeasy_ico_48_8.png geoeasy_ico_48_4.png  geoeasy_ico_32_24.png geoeasy_ico_32_8.png geoeasy_ico_32_4.png geoeasy_ico_16_8.png geoeasy_ico_16_4.png
GeoEasy.tcl: source
	rm -f GeoEasy.tcl
	$(TCL_CRUNCHER) build_date.tcl sources.tcl defaultmask.tcl ${GE_SOURCES} > GeoEasy.tcl
	chmod +x GeoEasy.tcl

source: ${GE_SOURCES} index.tcl
	rm -f tclIndex
	echo "#-----------------------------------------------------" > defaultmask.tcl
	echo "#	-- SetDefaultMsk" >> defaultmask.tcl
	echo "#	Set defaults for .msk file if it is missing, destroyd" >> defaultmask.tcl
	echo "#-----------------------------------------------------" >> defaultmask.tcl
	echo "proc SetDefaultMsk {} {" >> defaultmask.tcl
	cat geo_easy.msk >> defaultmask.tcl
	echo "}" >> defaultmask.tcl
	echo global build_date > build_date.tcl
	echo set build_date `date +%Y.%m.%d.` >> build_date.tcl
	echo "global ge_sources" > sources.tcl
	echo "set ge_sources {${GE_SOURCES}}" >> sources.tcl
	./index.tcl ${GE_SOURCES}
#
#	serial communication
#
ComEasy: ComEasy.tcl
	$(FREE_WRAP)/linux64/freewrap ComEasy.tcl -forcewrap -o ComEasy

ComEasy.exe: ComEasy.tcl
	$(FREE_WRAP)/linux64/freewrap ComEasy.tcl -w $(FREE_WRAP)/win32/freewrap.exe -i gizi.ico -forcewrap -o ComEasy.exe
ComEasy64.exe: ComEasy.tcl
	$(FREE_WRAP)/linux64/freewrap ComEasy.tcl -w $(FREE_WRAP)/win64/freewrap.exe -i gizi.ico -forcewrap -o ComEasy64.exe
ComEasy.tcl: ${CE_SOURCES}
	$(TCL_CRUNCHER) ${CE_SOURCES} > ComEasy.tcl
	chmod +x ComEasy.tcl

linux: GeoEasy ./i18n/geo_easy.* ./i18n/com_easy.* geo_easy.msk
	rm -f Gizi${VERSION}Linux.tgz
	tar cvzf Gizi${VERSION}Linux.tgz GeoEasy geo_easy.msk default.msk \
		./i18n/geo_easy.* ./i18n/com_easy.* \
		com_set demodata
doc: ${DOC_SOURCES}
	# update version
	VVV=${VERSION}
	sed '1,100s/_VERSION_/${VVV}/g' overview.html.template > overview.html
	# generate doc
	$(TCL_DOC) --overview overview.html --force ../tcldoc \
		${DOC_SOURCES}
deb-init:
	@mkdir -pv ${DEB_PATH}/DEBIAN ${DEB_PATH}/CONTENTS/usr/bin ${DEB_PATH}/CONTENTS/usr/share/doc/geoeasy ${DEB_PATH}/CONTENTS/usr/share/geoeasy ${DEB_PATH}/CONTENTS/usr/share/applications ${DEB_PATH}/CONTENTS/usr/share/menu ${DEB_PATH}/CONTENTS/usr/share/pixmaps ${DEB_PATH}/CONTENTS/usr/share/man/man1
	@mkdir -pv ${DEBDOC_PATH}/DEBIAN ${DEBDOC_PATH}/CONTENTS/usr/share/doc/geoeasy
deb-share: source ${CE_SOURCES}
	@cp -frv ${DEB_FILES} ${DEB_PATH}/CONTENTS/usr/share/geoeasy
	@cp -frv ../README.md ../LICENSE ${DEB_PATH}/CONTENTS/usr/share/doc/geoeasy
	@cp -fv ../doc/man/man1/geoeasy.1 ${DEB_PATH}/CONTENTS/usr/share/man/man1
deb-external:
	@ln -svf ${EXTERNAL_CS2CS} ${DEB_PATH}/CONTENTS/usr/share/geoeasy/cs2cs
	@ln -svf ${EXTERNAL_GAMMALOCAL} ${DEB_PATH}/CONTENTS/usr/share/geoeasy/gama-local
	@ln -svf ${EXTERNAL_TRIANGLE} ${DEB_PATH}/CONTENTS/usr/share/geoeasy/triangle
deb-config:
	echo "Package: geoeasy" > ${DEB_PATH}/DEBIAN/control
	echo -n "Version: " >> ${DEB_PATH}/DEBIAN/control
	echo ${VERSION}-${OSDISTNAME} >> ${DEB_PATH}/DEBIAN/control
	echo "Architecture: all" >> ${DEB_PATH}/DEBIAN/control
	echo "Maintainer: Zoltan Siki <zsiki@github.com>" >> ${DEB_PATH}/DEBIAN/control
	echo "Section: science" >> ${DEB_PATH}/DEBIAN/control
	echo "Priority: optional" >> ${DEB_PATH}/DEBIAN/control
	echo "Depends: tk (>= 8.5.0-1) | wish" >> ${DEB_PATH}/DEBIAN/control
	echo "Recommends: gama, triangle-bin, proj-bin" >> ${DEB_PATH}/DEBIAN/control
	echo -n "Installed-Size: " >> ${DEB_PATH}/DEBIAN/control
	du -s ${DEB_PATH} | grep -o [0-9]* >> ${DEB_PATH}/DEBIAN/control
	echo "Homepage: https://github.com/zsiki/GeoEasy" >> ${DEB_PATH}/DEBIAN/control
	echo "Description: GeoEasy - surveying calculation, network adjustment" >> ${DEB_PATH}/DEBIAN/control
	echo " GeoEasy - surveying calculation, network adjustment," >> ${DEB_PATH}/DEBIAN/control
	echo " digital terrain models, regression calculation." >> ${DEB_PATH}/DEBIAN/control
	@cp -fv ../doc/debian/postinst.sh ${DEB_PATH}/DEBIAN/postinst
	@cp -fv ../doc/debian/postrm.sh ${DEB_PATH}/DEBIAN/postrm
deb-exec:
	@cp -fv ../doc/debian/geoeasy.sh ${DEB_PATH}/CONTENTS/usr/bin/geoeasy
	@cp -fv ../doc/debian/geoeasy.desktop ${DEB_PATH}/CONTENTS/usr/share/applications
	@cp -fv ../doc/debian/geoeasy.menu ${DEB_PATH}/CONTENTS/usr/share/menu/geoeasy
	@cp -fv ../doc/debian/geoeasy.png ../doc/debian/geoeasy.xpm ${DEB_PATH}/CONTENTS/usr/share/pixmaps
deb-doc:
	@cp -frv ../doc/*.odp ../doc/*.rst ${DEBDOC_PATH}/CONTENTS/usr/share/doc/geoeasy
deb-doc-config:
	echo "Package: geoeasy-doc" > ${DEBDOC_PATH}/DEBIAN/control
	echo -n "Version: " >> ${DEBDOC_PATH}/DEBIAN/control
	echo ${VERSION}-${OSDISTNAME} >> ${DEBDOC_PATH}/DEBIAN/control
	echo "Architecture: all" >> ${DEBDOC_PATH}/DEBIAN/control
	echo "Maintainer: Zoltan Siki <zsiki@github.com>" >> ${DEBDOC_PATH}/DEBIAN/control
	echo "Section: doc" >> ${DEBDOC_PATH}/DEBIAN/control
	echo "Priority: optional" >> ${DEBDOC_PATH}/DEBIAN/control
	echo -n "Installed-Size: " >> ${DEBDOC_PATH}/DEBIAN/control
	du -s ${DEBDOC_PATH} | grep -o [0-9]* >> ${DEBDOC_PATH}/DEBIAN/control
	echo "Homepage: https://github.com/zsiki/GeoEasy" >> ${DEBDOC_PATH}/DEBIAN/control
	echo "Description: Documentation for Geoeasy" >> ${DEBDOC_PATH}/DEBIAN/control
	echo " GeoEasy - surveying calculation, network adjustment," >> ${DEBDOC_PATH}/DEBIAN/control
	echo " digital terrain models, regression calculation." >> ${DEBDOC_PATH}/DEBIAN/control
	echo " Documentation." >> ${DEBDOC_PATH}/DEBIAN/control
deb: deb-init deb-share deb-external deb-config deb-exec deb-doc deb-doc-config
	@cp -fv ../doc/debian/README.md ${DEBBASE_PATH}
	@echo "-----------------------------------------------------"
	@echo "cd ${DEBBASE_PATH}"
	@echo "Read README.md"
	@echo "-----------------------------------------------------"

manual: ../doc/man/man1/geoeasy.1.pdf
../doc/man/man1/geoeasy.1.pdf: ../doc/man/man1/geoeasy.1
	groff -m man -T pdf $^ > $@

clean:
	rm -f GeoEasy.tcl GeoEasy GeoEasy.exe GeoEasy64.exe \
		ComEasy.tcl ComEasy ComEasy.exe ComEasy64.exe \
		build_date.tcl sources.tcl defaultmask.tcl Gizi*.tgz\
		i18n/eng_[a-z][a-z]*.txt i18n/ceng_[a-z][a-z]*.txt \
		i18n/eng.txt
