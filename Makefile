FIGURE_DIRS := $(wildcard figures/fig*)
BIB := $(wildcard *.bib)
CLS := $(wildcard *.cls)

PDFs := paper-plos.pdf text1.pdf

.PHONY: all pdf clean

all: pdf

pdf: ${PDFs}

# missing dep to figures.
%.pdf: %.tex ${BIB} ${CLS}
	@echo "############## Making $@"
	pdflatex $(basename $@)
	bibtex $(basename $@)
	pdflatex $(basename $@)
	pdflatex $(basename $@)

#figures: ${FIGURE_DIRS}

#${FIGURE_DIRS}:
#	$@/makefig1.sh


.SUFFIXES:
.SUFFIXES: .svg .jpg .png .eps

.svg.eps:
	inkscape -D -z --file=$< --export-eps=$@ --export-dpi=300 --export-ignore-filters

.jpg.eps:
	convert $< >  $@

.png.jpg:
	convert -quality 100 $< $@

.gif.jpg:
	convert -quality 100 $< $@

clean:
	- rm -f *.out *.aux *.log *.bbl *.dvi *.ps *.blg *~ *.bak *.ilg *.ind *.idx *.dep *.toc *.brf *.lbl ${PDFs}
