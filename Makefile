images = flash-ram-mm.png linker.png relocation.png sections.png

%.png: %.dia
	dia --export=$@ --filter=png-libart $<

%.png: %.svg
	inkscape --without-gui --export-background="#ffffcc" $(and ($EXPORT_WIDTH),--export-width=$(EXPORT_WIDTH)) --export-area-drawing --export-png=$@ $<

all: gnu-eprog.html $(images)

%.xml: %.txt
	asciidoc -b docbook  $<

%.untidy.html: %.xml
	xsltproc docbook.xsl  $< > $@

%.html: %.untidy.html
	-tidy $< > $@

clean:
	rm -f *.html
	rm -f $(images)