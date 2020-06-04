ifeq ($(BUILDDIR),)
	BUILDDIR=./build
endif

all: $(BUILDDIR) pdf paper.tex

pdf: $(BUILDDIR)/Титульник.pdf $(BUILDDIR)/Задание.pdf $(BUILDDIR)/Аннотация.pdf $(BUILDDIR)/paper.pdf
	pdfunite $^ $(BUILDDIR)/VKR.pdf

diagrams: $(BUILDDIR)/first.png               \
          $(BUILDDIR)/second.png              \
		  $(BUILDDIR)/test-emu.png            \
		  $(BUILDDIR)/packet-view.png         \
		  $(BUILDDIR)/pinger.png              \
		  $(BUILDDIR)/router-architecture.png \
		  $(BUILDDIR)/dhcp-simple.png         \
		  $(BUILDDIR)/dhcp-configurator.png   \
		  $(BUILDDIR)/dhcp-activity-relay.png \
		  $(BUILDDIR)/relay-net.png           \
		  $(BUILDDIR)/complex-options.png     \
		  $(BUILDDIR)/pool.png                \
		  $(BUILDDIR)/address-allocator.png


$(BUILDDIR):
	mkdir $(BUILDDIR)

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

$(BUILDDIR)/dhcp-configurator.png: dia/dhcp-configurator.dia
	dia $^ --export $@

$(BUILDDIR)/dhcp-activity-relay.png: dia/dhcp-activity-relay.dia
	dia $^ --export $@

$(BUILDDIR)/relay-net.png: dia/relay-net.dia
	dia $^ --export $@

$(BUILDDIR)/complex-options.png: dia/complex-options.dia
	dia $^ --export $@

$(BUILDDIR)/pool.png: dia/pool.dia
	dia $^ --export $@

$(BUILDDIR)/address-allocator.png: dia/address-allocator.dia
	dia $^ --export=$@

$(BUILDDIR)/Аннотация.pdf: burocracy/Аннотация.docx
	libreoffice --headless --convert-to pdf --outdir $(BUILDDIR) $^

$(BUILDDIR)/Задание.pdf: burocracy/Задание.docx
	libreoffice --headless --convert-to pdf --outdir $(BUILDDIR) $^

$(BUILDDIR)/Титульник.pdf: burocracy/Титульник.docx
	libreoffice --headless --convert-to pdf --outdir $(BUILDDIR) $^

clean:
	rm -r $(BUILDDIR)
