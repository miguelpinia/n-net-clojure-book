FILE_TEX=main
DATESTAMP=`date +'%Y-%m-%d'`

all: pdflatex

pdflatex: clean
	pdflatex ${FILE_TEX}.tex
	pdflatex ${FILE_TEX}.tex
	makeindex ${FILE_TEX}.nlo -s nomencl.ist -o ${FILE_TEX}.nls
	bibtex ${FILE_TEX}
	pdflatex ${FILE_TEX}.tex
	pdflatex ${FILE_TEX}.tex
	pdflatex ${FILE_TEX}.tex
	pdflatex ${FILE_TEX}.tex
	mkdir -p time-machine/${DATESTAMP}
	cp ${FILE_TEX}.pdf time-machine/${DATESTAMP}/${FILE_TEX}.pdf
	make clean

view:
	evince ${FILE_TEX}.pdf &

clean:
	ls ${FILE_TEX}.* | grep -v \.tex$ | grep -v \.bib$ | grep -v \.tcp$ | xargs rm -fv
	rm -fv *log *aux *dvi *lof *lot *bit *idx *glo *bbl *ilg *toc *ind *blg *out *nlo *brf *nls ${FILE_TEX}.pdf
	find . -regex '.*.aux' -print0 | xargs -0 rm -rfv
	find . -regex '.*.log' -print0 | xargs -0 rm -rfv
	find . -regex '.*.bbl' -print0 | xargs -0 rm -rfv
	find . -regex '.*.blg' -print0 | xargs -0 rm -rfv
