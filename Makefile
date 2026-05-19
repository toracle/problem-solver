export RUBYOPT := -Eutf-8

BOOKS         := reading workbook facilitator
LANGS         := en ko
BUILDDIR      := build
FONTS         ?= fonts
FONT_STAMP    := $(FONTS)/NotoSerifKR-Regular.ttf
THEME         := theme/pdf-theme.yml
READING_THEME := theme/reading-theme.yml
DOCINFO_DIR   := $(abspath theme)
META_URL      ?= https://toracle.github.io/books

# English HTML/PDF targets (root of build dir)
HTML_EN  := $(addprefix $(BUILDDIR)/,$(addsuffix .html,$(BOOKS)))
PDF_EN   := $(addprefix $(BUILDDIR)/,$(addsuffix .pdf,$(BOOKS)))
# Korean HTML/PDF targets (under build/ko/)
HTML_KO  := $(addprefix $(BUILDDIR)/ko/,$(addsuffix .html,$(BOOKS)))
PDF_KO   := $(addprefix $(BUILDDIR)/ko/,$(addsuffix .pdf,$(BOOKS)))

.PHONY: all html pdf fonts site clean help \
        html-en html-ko pdf-en pdf-ko

all: site

site: html pdf
	@mkdir -p $(BUILDDIR) $(BUILDDIR)/ko
	@cp site/index.html $(BUILDDIR)/index.html
	@cp site/ko/index.html $(BUILDDIR)/ko/index.html
	@echo "→ Site: $(BUILDDIR)/index.html (en), $(BUILDDIR)/ko/index.html (ko)"

html: html-en html-ko
pdf:  pdf-en pdf-ko

html-en: $(HTML_EN)
html-ko: $(HTML_KO)
pdf-en:  $(PDF_EN)
pdf-ko:  $(PDF_KO)

fonts: $(FONT_STAMP)

$(FONT_STAMP): scripts/generate-fonts.sh
	bash scripts/generate-fonts.sh

# ─── English HTML ───
$(BUILDDIR)/%.html: %/en/index.adoc %/en/*.adoc | $(BUILDDIR)
	bundle exec asciidoctor \
	  -a docinfo=shared \
	  -a docinfodir=$(DOCINFO_DIR) \
	  -a nav-home-url=$(META_URL)/ \
	  -a nav-home-label="← All Books" \
	  -a lang-self=EN \
	  -a lang-other-url=ko/$*.html \
	  -a lang-other-label="한국어" \
	  -D $(BUILDDIR) -o $*.html $<

# ─── Korean HTML ───
$(BUILDDIR)/ko/%.html: %/ko/index.adoc %/ko/*.adoc | $(BUILDDIR)/ko
	bundle exec asciidoctor \
	  -a docinfo=shared \
	  -a docinfodir=$(DOCINFO_DIR) \
	  -a nav-home-url=$(META_URL)/ko/ \
	  -a nav-home-label="← 책 목록" \
	  -a lang-self=KO \
	  -a lang-other-url=../$*.html \
	  -a lang-other-label="English" \
	  -D $(BUILDDIR)/ko -o $*.html $<

# ─── PDFs: reading uses reading-theme; others use default theme ───
$(BUILDDIR)/reading.pdf: reading/en/index.adoc reading/en/*.adoc $(FONT_STAMP) $(READING_THEME) | $(BUILDDIR)
	bundle exec asciidoctor-pdf \
	  -a pdf-theme=$(READING_THEME) \
	  -a "pdf-fontsdir=$(FONTS)" \
	  -a allow-uri-read \
	  -D $(BUILDDIR) -o reading.pdf $<

$(BUILDDIR)/ko/reading.pdf: reading/ko/index.adoc reading/ko/*.adoc $(FONT_STAMP) $(READING_THEME) | $(BUILDDIR)/ko
	bundle exec asciidoctor-pdf \
	  -a pdf-theme=$(READING_THEME) \
	  -a "pdf-fontsdir=$(FONTS)" \
	  -a allow-uri-read \
	  -D $(BUILDDIR)/ko -o reading.pdf $<

$(BUILDDIR)/%.pdf: %/en/index.adoc %/en/*.adoc $(FONT_STAMP) $(THEME) | $(BUILDDIR)
	bundle exec asciidoctor-pdf \
	  -a pdf-theme=$(THEME) \
	  -a "pdf-fontsdir=$(FONTS)" \
	  -a allow-uri-read \
	  -D $(BUILDDIR) -o $*.pdf $<

$(BUILDDIR)/ko/%.pdf: %/ko/index.adoc %/ko/*.adoc $(FONT_STAMP) $(THEME) | $(BUILDDIR)/ko
	bundle exec asciidoctor-pdf \
	  -a pdf-theme=$(THEME) \
	  -a "pdf-fontsdir=$(FONTS)" \
	  -a allow-uri-read \
	  -D $(BUILDDIR)/ko -o $*.pdf $<

$(BUILDDIR):
	mkdir -p $(BUILDDIR)

$(BUILDDIR)/ko:
	mkdir -p $(BUILDDIR)/ko

clean:
	rm -rf $(BUILDDIR)

help:
	@echo "Usage:"
	@echo "  make html      - Build all HTML books (both languages)"
	@echo "  make pdf       - Build all PDF books (both languages)"
	@echo "  make all/site  - Build everything + landing pages"
	@echo "  make html-en   - English HTML only"
	@echo "  make html-ko   - Korean HTML only"
	@echo "  make pdf-en    - English PDF only"
	@echo "  make pdf-ko    - Korean PDF only"
	@echo "  make fonts     - Download and generate fonts"
	@echo "  make clean     - Remove build directory"
	@echo ""
	@echo "Prerequisites:"
	@echo "  bundle install"
	@echo "  pip3 install fonttools"
