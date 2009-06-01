images = flash-ram-mm.png \
	 linker.png \
	 relocation.png \
	 sections.png \
	 stack.png \
	 csections.png

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
	credits.html \
	c-library.html \
	inline-assembly.html \
	arm-stacks.html

all: $(htmls) $(images) highlight.pack.js revision.rss

$(htmls): gnu-eprog.xml 
	xsltproc docbook.xsl  $<
	imgsizer $(htmls)
	-tidy --quiet -m $(htmls) 2> /dev/null

revision.rss: gnu-eprog.xml
	xsltproc rss.xsl gnu-eprog.xml | tr -s "\n" > revision.rss

%.xml: %.txt
	asciidoc -b docbook  $<

%.png: %.dia
	dia --export=$@ --filter=png-libart $<

highlight.pack.js: highlight.js
	cat highlight.js | python jsmin.py > highlight.pack.js

clean:
	rm -f *.html
	rm -f gnu-eprog.xml
	rm -f $(images)

distclean: clean
	find . -name "*~" -exec rm -f {} ";"

upload:
	lftp -f upload.lftp
