images = flash-ram-mm.png linker.png relocation.png sections.png
htmls = arm-iset.html \
	asm-directives.html \
	data-in-ram.html \
	index.html \
	using-ram.html \
	arm-lab.html \
	copyright.html \
	exc-handle.html \
	lds.html \
	arm-prog-model.html \
	c-startup.html \
	hello-arm.html \
	linker.html

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
