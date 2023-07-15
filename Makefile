# TODO: Add svn commit target

# Makefile for dissertation
# 
# Note that the rsync targets rely on the private ssh key.
# This is NOT included with this Makefile. Further, this Makefile 
# relies on bash script wrapping up the latex2html parameters.
# This script can be downloaded from:
# http://www.henrikfrisk.com/documents/downloads/l2html.sh
#
# If you wish to adapt this Makefile for your own projects
# follow the excellent instructions at:
# http://troy.jdmz.net/rsync/index.html
# on how to set up a safe but fully automated ssh'ed rsync 
# conection to your server.
#
# 24 September 2007	Henrik Frisk	mail@henrikfrisk.com

SHELL := /bin/bash
SOURCE_DIR          := .
WEB_DIR	:= $(SOURCE_DIR)/_site
ASSETS := $(SOURCE_DIR)/assets
IMG_DIR           := $(SOURCE_DIR)/assets/images
OUTPUT_DIR        := $(SOURCE_DIR)/_site
HTML_DIR          := $(SOURCE_DIR)/_pages
REQUIRED_DIRS      = $(OUTPUT_DIR) $(HTML_DIR) $(IMG_DIR)
SERVER 		:= public_html
FTP_SERVER  	:= csrv11.aname.net

AUTHOR := "Henrik Frisk, mail<AT>henrikfrisk<DOT>com"

BIN	= /usr/bin
PDFLATEX = /usr/bin/pdflatex
HTLATEX = /usr/bin/htlatex
RSYNC	= $(BIN)/rsync -avuzhr
FTP = $(SOURCE_DIR)/ftp_command
WC = /usr/bin/wc
GEM = /Users/henrik_frisk/.gem
JEKYLL = `which jekyll`

PS        = $(source:.tex=.ps)
BBL       =  $(source:.tex=.bbl)
HTML	= $(HTML_DIR)/index.html
CSS	= $(ASSETS)/css/main.

source := $(wildcard *.md)
cv_source := ~/Documents/info/cv/curriculum/CurriculumVitae-2022.tex
img = default.jpg
current_img := $(IMG_DIR)/$(img)
img_edit = $(img:.jpg=_edit.jpg)
img_edit_l = $(img:.jpg=_large.jpg)
#source := utvalda-publikationer.tex

## include out/module.mk

.SUFFIXES:
.SUFFIXES: .ps .dvi .bib .aux .ltx .pdf

.aux.bib: ; $(BIBTEX) $*

### TARGETS
DVI = $(source:.tex=.dvi)
BLG       = $(source:.tex=.blg)
AUX       = $(source:.tex=.aux)
LOG       = $(source:.tex=.log)
LOGS      = $(OUTPUT_DIR)/$(AUX) $(OUTPUT_DIR)/$(BLG) $(OUTPUT_DIR)/$(LOG)

PS        = $(source:.tex=.ps)
PDF	  = $(source:.tex=.pdf)

all: site sync

.PHONY: echo_src sync img_info

echo_src:
	echo $(JEKYLL)
	$(HTLATEX) $(cv_source) $(htlatex_arg)

.PHONY: echo_pdf

echo_pdf:
	echo $(pdfs) 

img_info:
	identify $(IMG_DIR)/$(img)

img_scale: 
	convert -strip -interlace Plane -gaussian-blur 0.05 -quality 85% -scale 75% $(IMG_DIR)/$(img) $(IMG_DIR)/$(img_edit)

img_scale_large: 
	convert -strip -interlace Plane -gaussian-blur 0.05 -quality 85% -resize 2560x1538^ $(IMG_DIR)/$(img) $(IMG_DIR)/$(img_edit_l)

img_mv:
	mv $(IMG_DIR)/$(img_edit) $(IMG_DIR)/$(img)

cp_cv: $(cv_source)
	cp $(cv_source) $(HTML_DIR)/curri.html

site :
	$(JEKYLL) build

sync : site
	@echo "Running site and ftp sync on _site...\n\n"
	$(shell $(FTP))

synctest :
	@echo "Running sync test"
	$(shell ./ftp_command_test)

synconly : 
	@echo "Running ftp on _site...\n\n"
	$(shell $(FTP))	

clean:
	$(JEKYLL) clean
