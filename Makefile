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

SOURCE_DIR          := ./
WEB_DIR	:= $(SOURCE_DIR)/_site
ASSETS := $(SOURCE_DIR)/assets
IMG_DIR           := $(SOURCE_DIR)/assets/images
OUTPUT_DIR        := $(SOURCE_DIR)/_site
HTML_DIR          := $(SOURCE_DIR)/_pages
REQUIRED_DIRS      = $(OUTPUT_DIR) $(HTML_DIR) $(IMG_DIR)

AUTHOR := "Henrik Frisk, mail<AT>henrikfrisk<DOT>com"

BIN	= /usr/bin
PDFLATEX = /usr/bin/pdflatex
HTLATEX = /usr/bin/htlatex
RSYNC	= $(BIN)/rsync -avuzhr --delete
WC = /usr/bin/wc
GEM = /home/henrikfr/gems
JEKYLL = $(GEM)/bin/jekyll

PS        = $(source:.tex=.ps)
BBL       =  $(source:.tex=.bbl)
HTML	= $(HTML_DIR)/index.html
CSS	= $(ASSETS)/css/main.

SERVER 	= henrikfr@henrikfrisk.com:www/

source := $(wildcard *.md)
cv_source := ~/Documents/info/cv/curriculum/CurriculumVitae-2022.tex

#source := utvalda-publikationer.tex

## include out/module.mk

.SUFFIXES:
.SUFFIXES: .ps .dvi .bib .aux .ltx .pdf

.aux.bib: ; $(BIBTEX) $*

### TARGETS
DVI       = $(source:.tex=.dvi)
BLG       = $(source:.tex=.blg)
AUX       = $(source:.tex=.aux)
LOG       = $(source:.tex=.log)
LOGS      = $(OUTPUT_DIR)/$(AUX) $(OUTPUT_DIR)/$(BLG) $(OUTPUT_DIR)/$(LOG)

PS        = $(source:.tex=.ps)
PDF	      = $(source:.tex=.pdf)

all: site sync

.PHONY: echo_src sync

echo_src:
	echo $(source)
	$(HTLATEX) $(cv_source) $(htlatex_arg)

.PHONY: echo_pdf

echo_pdf:
	echo $(pdfs) 

cp_cv: $(cv_source)
	cp $(cv_source) $(HTML_DIR)/curri.html

htlatex: $(cv_source)
	$(HTLATEX) $(cv_source) $(htlatex_arg)
# Some latex file needs to be run at least three times to be sure to resolve all references.

site :
	$(JEKYLL) build

sync : site
	$(RSYNC) $(SRC_DIR)/ $(SERVER)

clean:
	$(JEKYLL) clean
