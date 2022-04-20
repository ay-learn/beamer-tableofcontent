DOC  := main.tex

RERUN := "(undefined references|Rerun to get (cross-references|the bars|point totals) right|Table widths have changed. Rerun LaTeX.|Linenumber reference failed)"
RERUNBIB := "No file.*\.bbl|Citation.*undefined"




# %.pdf: %.tex
# 	pdflatex $<
# 	@egrep -q $(RERUNBIB) $*.log && bibtex $* && pdflatex $<; true
# 	@egrep -q $(RERUN) $*.log && pdflatex $<; true
# 	@egrep -q $(RERUN) $*.log && pdflatex $<; true

latexmk:
	latexmk -pdf -pvc -interaction=nonstopmode -outdir=build $(DOC) -f


clean:
	@  echo clean
	@- bash -c 'rm -f *.{mtc*,maf*,pdf,aux,dvi,xdv,log,bbl,blg,brf,fls,toc,thm,out,fdb_latexmk}'
	@- bash -c 'rm -rf build'

# clean: purge
# 	-rm -f $(DOC:.tex=.pdf)

.PHONY: all purge clean
