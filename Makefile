ifeq ($(BUILDDIR),)
	BUILDDIR=./build
endif

all: $(BUILDDIR) pdf аннотация.tex paper.tex

pdf: $(BUILDDIR)/аннотация.pdf $(BUILDDIR)/paper.pdf

diagrams: $(BUILDDIR)/first.png               \
          $(BUILDDIR)/second.png              \
		  $(BUILDDIR)/test-emu.png            \
		  $(BUILDDIR)/packet-view.png         \
		  $(BUILDDIR)/pinger.png              \
		  $(BUILDDIR)/router-architecture.png \
		  $(BUILDDIR)/dhcp-simple.png


$(BUILDDIR):
	mkdir $(BUILDDIR)

$(BUILDDIR)/аннотация.pdf: аннотация.tex
	pdflatex -output-directory $(BUILDDIR) $^

$(BUILDDIR)/paper.pdf: paper.tex diagrams
	pdflatex -output-directory $(BUILDDIR) $^

$(BUILDDIR)/first.png: dia/first.dia
	dia $^ --export $@

$(BUILDDIR)/second.png: dia/second.dia
	dia $^ --export $@

$(BUILDDIR)/test-emu.png: dia/test-emu.dia
	dia $^ --export $@

$(BUILDDIR)/packet-view.png: dia/packet-view.dia
	dia $^ --export $@

$(BUILDDIR)/pinger.png: dia/pinger.dia
	dia $^ --export $@

$(BUILDDIR)/router-architecture.png: dia/router-architecture.dia
	dia $^ --export $@

$(BUILDDIR)/dhcp-simple.png: dia/dhcp-simple.dia
	dia $^ --export $@

clean:
	rm -r $(BUILDDIR)
