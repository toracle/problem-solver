export RUBYOPT := -Eutf-8

BOOKS      := workbook reading facilitator
BUILDDIR   := build
FONTS      ?= fonts
FONT_STAMP := $(FONTS)/NotoSerifKR-Regular.ttf
THEME      := theme/pdf-theme.yml

HTML_TARGETS := $(addprefix $(BUILDDIR)/,$(addsuffix .html,$(BOOKS)))
PDF_TARGETS  := $(addprefix $(BUILDDIR)/,$(addsuffix .pdf,$(BOOKS)))

.PHONY: all html pdf fonts clean help

all: html pdf

html: $(HTML_TARGETS)

pdf: $(PDF_TARGETS)

fonts: $(FONT_STAMP)

$(FONT_STAMP): scripts/generate-fonts.sh
	bash scripts/generate-fonts.sh

$(BUILDDIR)/%.html: %/index.adoc %/*.adoc | $(BUILDDIR)
	bundle exec asciidoctor -D $(BUILDDIR) -o $*.html $<

$(BUILDDIR)/%.pdf: %/index.adoc %/*.adoc $(FONT_STAMP) $(THEME) | $(BUILDDIR)
	bundle exec asciidoctor-pdf \
	  -a pdf-theme=$(THEME) \
	  -a "pdf-fontsdir=$(FONTS)" \
	  -D $(BUILDDIR) -o $*.pdf $<

$(BUILDDIR):
	mkdir -p $(BUILDDIR)

clean:
	rm -rf $(BUILDDIR)

help:
	@echo "Usage:"
	@echo "  make html   - Build all HTML books"
	@echo "  make pdf    - Build all PDF books"
	@echo "  make all    - Build both HTML and PDF"
	@echo "  make fonts  - Download and generate fonts"
	@echo "  make clean  - Remove build directory"
	@echo ""
	@echo "Prerequisites:"
	@echo "  bundle install"
	@echo "  pip3 install fonttools"
