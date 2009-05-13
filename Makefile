images = flash-ram-mm.png linker.png relocation.png sections.png
htmls = arm-iset.html \
	asm-directives.html \
	data-in-ram.html \
	index.html \
	using-ram.html \
	arm-lab.html \
	copyright.html \
	lds.html \
	arm-prog-model.html \
	hello-arm.html \
	linker.html \
	c-startup.html \
	exc-handle.html \
	contributing.html \
	credits.html

all: $(htmls)

$(htmls): gnu-eprog.xml $(images)
	xsltproc docbook.xsl  $< > $@
	-tidy -m $(htmls)

%.xml: %.txt
	asciidoc -b docbook  $<

%.png: %.dia
	dia --export=$@ --filter=png-libart $<

clean:
	rm -f *.html
	rm -f $(images)
