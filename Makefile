TEXFILES := $(shell find entries -name '*.tex')
OUTDIR := docs/entries

all: $(TEXFILES)
	mkdir -p $(OUTDIR)
	for tex in $(TEXFILES); do \
		pdf=$$(echo $$tex | sed 's|entries/|$(OUTDIR)/|' | sed 's|.tex|.pdf|'); \
		mkdir -p $$(dirname $$pdf); \
		pdflatex -interaction=nonstopmode -output-directory=$$(dirname $$pdf) $$tex; \
	done
