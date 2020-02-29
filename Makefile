ifeq ($(BUILDDIR),)
	BUILDDIR=./build
endif

all: $(BUILDDIR) pdf аннотация.tex paper.tex

pdf: $(BUILDDIR)/аннотация.pdf $(BUILDDIR)/paper.pdf

$(BUILDDIR):
	mkdir $(BUILDDIR)

$(BUILDDIR)/аннотация.pdf: аннотация.tex
	pdflatex -output-directory $(BUILDDIR) $^

$(BUILDDIR)/paper.pdf: paper.tex
	pdflatex -output-directory $(BUILDDIR) $^

clean:
	rm -r $(BUILDDIR)
