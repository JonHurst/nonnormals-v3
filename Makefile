pdf: pdf/notes.pdf

pdf/notes.pdf: notes.tex
	latexmk -pdflatex -output-directory=pdf notes.tex

html: build/lastbuilt

build/lastbuilt: notes.tex priv.cfg
	cd build; \
	cp ../priv.cfg .; \
	make4ht -u -d ../html ../notes.tex \
	"priv,xhtml,2,next,fn-in,charset=utf-8" \
	" -cunihtf -utf8"
	./fixup_external_links.sh
	touch build/lastbuilt
