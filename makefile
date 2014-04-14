pdf:
	pdflatex paper.tex
	bibtex paper.aux
	pdflatex paper.tex
	pdflatex paper.tex

proposal:
	pdflatex proposal.tex

clean:
	rm -f *.log *.aux *~
