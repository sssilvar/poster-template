MAIN    := main
OUT     := build
TEXINPUTS := theme:$(TEXINPUTS)
export TEXINPUTS
LATEXMK := latexmk -pdf -bibtex -interaction=nonstopmode -halt-on-error -outdir=$(OUT)

.PHONY: all watch view clean distclean
all: $(OUT)/$(MAIN).pdf

$(OUT)/$(MAIN).pdf: $(MAIN).tex refs.bib theme/*.sty $(wildcard img/*)
	$(LATEXMK) $(MAIN).tex

watch:
	$(LATEXMK) -pvc $(MAIN).tex

view: all
	xdg-open $(OUT)/$(MAIN).pdf

clean:
	latexmk -c -outdir=$(OUT) $(MAIN).tex

distclean:
	rm -rf $(OUT)
