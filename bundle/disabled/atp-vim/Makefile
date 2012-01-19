# This is a Makefile for Automatic Tex Plugin project.
# Written by Marcin Szamotulski.

# Usage:
# make 		-- generate vbm as well as tar.gz file,
# 		   it will also update time stamps in various places.
# make test	-- list files in *.tar.gz bundle
# make install	-- install it under ${INSTALL_DIR}
# make upload	-- upload new snaphot to SourceForge
# make release	-- upload new snaphot and new release to SourceForge
# make clean	-- delete *.tar.gz, *.vmb and msg file (which I use with 'svn -F msg')
PLUGIN 	= AutomaticTexPlugin
VERSION = 10.6.2
DATE	= $(shell date '+%d-%m-%y_%H-%M')
# The ${INSTALL_DIR} variable should point to one of your vim 'runtimepath'
# entries. I use pathogen, so my setting is more complicated:
INSTALL_DIR = ${HOME}/.vim/addons/AutomaticLaTexPlugin

SOURCE =  autoload/atplib.vim
SOURCE += autoload/atplib/bibsearch.vim
SOURCE += autoload/atplib/callback.vim
SOURCE += autoload/atplib/common.vim
SOURCE += autoload/atplib/compiler.vim
SOURCE += autoload/atplib/complete.vim
SOURCE += autoload/atplib/fontpreview.vim
SOURCE += autoload/atplib/helpfunctions.vim
SOURCE += autoload/atplib/motion.vim
SOURCE += autoload/atplib/search.vim
SOURCE += autoload/atplib/tools.vim
SOURCE += autoload/atplib/various.vim
SOURCE += colors/coots-beauty-256.vim
SOURCE += doc/automatic-tex-plugin.txt
SOURCE += doc/bibtex_atp.txt
SOURCE += doc/latexhelp.txt
SOURCE += ftplugin/ATP_files/LatexBox_common.vim
SOURCE += ftplugin/ATP_files/LatexBox_complete.vim
SOURCE += ftplugin/ATP_files/LatexBox_indent.vim
SOURCE += ftplugin/ATP_files/LatexBox_latexmk.vim
SOURCE += ftplugin/ATP_files/LatexBox_mappings.vim
SOURCE += ftplugin/ATP_files/LatexBox_motion.vim
SOURCE += ftplugin/ATP_files/abbreviations.vim
SOURCE += ftplugin/ATP_files/atp_RevSearch.py
SOURCE += ftplugin/ATP_files/common.vim
SOURCE += ftplugin/ATP_files/compile.py
SOURCE += ftplugin/ATP_files/compiler.vim
SOURCE += ftplugin/ATP_files/dictionaries/SIunits
SOURCE += ftplugin/ATP_files/dictionaries/ams_dictionary
SOURCE += ftplugin/ATP_files/dictionaries/dictionary
SOURCE += ftplugin/ATP_files/dictionaries/greek
SOURCE += ftplugin/ATP_files/dictionaries/tikz
SOURCE += ftplugin/ATP_files/latextags.py
SOURCE += ftplugin/ATP_files/makelatex.py
SOURCE += ftplugin/ATP_files/mappings.vim
SOURCE += ftplugin/ATP_files/menu.vim
SOURCE += ftplugin/ATP_files/motion.vim
SOURCE += ftplugin/ATP_files/options.vim
SOURCE += ftplugin/ATP_files/packages/amsmath.vim
SOURCE += ftplugin/ATP_files/packages/babel.vim
SOURCE += ftplugin/ATP_files/packages/beamer.vim
SOURCE += ftplugin/ATP_files/packages/biblatex.vim
SOURCE += ftplugin/ATP_files/packages/bibunits.vim
SOURCE += ftplugin/ATP_files/packages/cancel.vim
SOURCE += ftplugin/ATP_files/packages/caption.vim
SOURCE += ftplugin/ATP_files/packages/cite.vim
SOURCE += ftplugin/ATP_files/packages/color.vim
SOURCE += ftplugin/ATP_files/packages/enumitem.vim
SOURCE += ftplugin/ATP_files/packages/geometry.vim
SOURCE += ftplugin/ATP_files/packages/graphicx.vim
SOURCE += ftplugin/ATP_files/packages/hyperref.vim
SOURCE += ftplugin/ATP_files/packages/inputenc.vim
SOURCE += ftplugin/ATP_files/packages/libgreek.vim
SOURCE += ftplugin/ATP_files/packages/longtable.vim
SOURCE += ftplugin/ATP_files/packages/mathdesign.vim
SOURCE += ftplugin/ATP_files/packages/mathtools.vim
SOURCE += ftplugin/ATP_files/packages/ntheorem.vim
SOURCE += ftplugin/ATP_files/packages/standard_classes.vim
SOURCE += ftplugin/ATP_files/packages/stmaryrd.vim
SOURCE += ftplugin/ATP_files/packages/textcmds.vim
SOURCE += ftplugin/ATP_files/packages/url.vim
SOURCE += ftplugin/ATP_files/packages/xcolor.vim
SOURCE += ftplugin/ATP_files/project.vim
SOURCE += ftplugin/ATP_files/search.vim
SOURCE += ftplugin/ATP_files/tex-fold.vim
SOURCE += ftplugin/ATP_files/url_query.py
SOURCE += ftplugin/ATP_files/various.vim
SOURCE += ftplugin/ATP_files/vimcomplete.bst
SOURCE += ftplugin/bib_atp.vim
SOURCE += ftplugin/bibsearch_atp.vim
SOURCE += ftplugin/fd_atp.vim
SOURCE += ftplugin/plaintex_atp.vim
SOURCE += ftplugin/tex_atp.vim
SOURCE += ftplugin/toc_atp.vim
SOURCE += syntax/bibsearch_atp.vim
SOURCE += syntax/labels_atp.vim
SOURCE += syntax/log_atp.vim
SOURCE += syntax/toc_atp.vim

${Plugin}_${VERSION}.vmb: ${SOURCE}
	python stamp.py ${DATE} ${VERSION}
	python version.py ${VERSION}
	tar -czf ${PLUGIN}_${VERSION}.tar.gz ${SOURCE}
	vim -nX --cmd 'let g:plugin_name = "${PLUGIN}_${VERSION}"' -S build.vim -cq!

install:
	rsync -Rv ${SOURCE} ${INSTALL_DIR}
	vim --cmd :helptags\ ${INSTALL_DIR}/doc --cmd q!

clean:		
	rm ${PLUGIN}_[0-9.]*.*
	rm msg

test:
	tar -tzf ${PLUGIN}${VERSION}.tar.gz
upload:		
	cp ${PLUGIN}_${VERSION}.vmb ${PLUGIN}_${VERSION}.vmb.${DATE}
	cp ${PLUGIN}_${VERSION}.tar.gz ${PLUGIN}_${VERSION}.tar.gz.${DATE}
	scp ${PLUGIN}_${VERSION}.vmb.${DATE} ${PLUGIN}_${VERSION}.tar.gz.${DATE} mszamotulski,atp-vim@frs.sourceforge.net:/home/frs/project/a/at/atp-vim/snapshots/
	rm ${PLUGIN}_${VERSION}.vmb.${DATE} ${PLUGIN}_${VERSION}.tar.gz.${DATE}
release:		
	# upload snaphot and release (this is important for UploadATP command)
	cp ${PLUGIN}_${VERSION}.vmb ${PLUGIN}_${VERSION}.vmb.${DATE}
	cp ${PLUGIN}_${VERSION}.tar.gz ${PLUGIN}_${VERSION}.tar.gz.${DATE}
	scp ${PLUGIN}_${VERSION}.vmb.${DATE} ${PLUGIN}_${VERSION}.tar.gz.${DATE} mszamotulski,atp-vim@frs.sourceforge.net:/home/frs/project/a/at/atp-vim/snapshots/
	rm ${PLUGIN}_${VERSION}.vmb.${DATE} ${PLUGIN}_${VERSION}.tar.gz.${DATE}
	scp ${PLUGIN}_${VERSION}.vmb ${PLUGIN}_${VERSION}.tar.gz mszamotulski,atp-vim@frs.sourceforge.net:/home/frs/project/a/at/atp-vim/releases/
	echo '>> WRITE E-MAIL TO: Tim Harder <radhermit@gentoo.org>'
