ifeq ($(BUILDDIR),)
	BUILDDIR=./build
endif

all: $(BUILDDIR) pdf аннотация.tex

pdf: $(BUILDDIR)/аннотация.pdf

$(BUILDDIR):
	mkdir $(BUILDDIR)

$(BUILDDIR)/аннотация.pdf: аннотация.tex
	pdflatex -output-directory $(BUILDDIR) $^

clean:
	rm -r $(BUILDDIR)
