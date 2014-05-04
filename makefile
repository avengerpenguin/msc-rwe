pdf:
	pdflatex paper.tex
	bibtex paper.aux
	pdflatex paper.tex
	pdflatex paper.tex
	@echo "Word counts:"
	@echo "Chapter 1: `detex chapter1.tex | wc -w`\t/   500"
	@echo "Chapter 2: `detex chapter2.tex | wc -w`\t/  1500"
	@echo "Chapter 3: `detex chapter3.tex | wc -w`\t/  2500"
	@echo "Chapter 4: `detex chapter4.tex | wc -w`\t/  2500"
	@echo "Chapter 5: `detex chapter5.tex | wc -w`\t/  2500"
	@echo "Chapter 6: `detex chapter6.tex | wc -w`\t/   500"
	@echo "Total    : `detex paper.tex    | wc -w`\t/ 10000"

proposal:
	pdflatex proposal.tex

clean:
	rm -f *.log *.aux *~
