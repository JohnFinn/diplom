ifeq ($(BUILDDIR),)
	BUILDDIR=./build
endif

all: $(BUILDDIR) pdf аннотация.tex paper.tex

pdf: $(BUILDDIR)/аннотация.pdf $(BUILDDIR)/paper.pdf

diagrams: $(BUILDDIR)/first.png

$(BUILDDIR):
	mkdir $(BUILDDIR)

$(BUILDDIR)/аннотация.pdf: аннотация.tex
	pdflatex -output-directory $(BUILDDIR) $^

$(BUILDDIR)/paper.pdf: paper.tex diagrams
	pdflatex -output-directory $(BUILDDIR) $^

$(BUILDDIR)/first.png: dia/first.dia
	dia $^ --export $@

clean:
	rm -r $(BUILDDIR)
