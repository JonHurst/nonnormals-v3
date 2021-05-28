pdf: pdf/notes.pdf

pdf/notes.pdf: notes.tex
	pdflatex -output-directory pdf notes.tex
	pdflatex -output-directory pdf notes.tex

html: build/lastbuilt

build/lastbuilt: notes.tex priv.cfg
	cd build; \
	cp ../priv.cfg .; \
	make4ht -u -d ../html ../notes.tex \
	"priv,xhtml,2,next,fn-in,charset=utf-8" \
	" -cunihtf -utf8"
	touch build/lastbuilt

stage: pdf/notes.pdf build/lastbuilt
	cp pdf/notes.pdf \
	html/*.html \
	html/*.css \
	$(HOME)/docs/s3-website/nnv3/
	stage-website
	touch stage
