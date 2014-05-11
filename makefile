pdf: question-time.png politics.png keepod.png keepod-tagged.png
	pdflatex --shell-escape paper.tex
	bibtex paper.aux
	pdflatex --shell-escape paper.tex
	pdflatex --shell-escape paper.tex
	@echo "Word counts:"
	@echo "Chapter 1: `detex chapter1.tex | wc -w`\t/   750"
	@echo "Chapter 2: `detex chapter2.tex | wc -w`\t/  2250"
	@echo "Chapter 3: `detex chapter3.tex | wc -w`\t/  3750"
	@echo "Chapter 4: `detex chapter4.tex | wc -w`\t/  3750"
	@echo "Chapter 5: `detex chapter5.tex | wc -w`\t/  3750"
	@echo "Chapter 6: `detex chapter6.tex | wc -w`\t/   750"
	@echo "Total    : `detex paper.tex    | wc -w`\t/ 15000"
	@python -c "print 100 * `detex paper.tex | wc -w` / 10000, '%'"
	@python -c "print 100 * `detex paper.tex | wc -w` / 15000, '%'"

question-time.png:
	rapper -i turtle -o dot question-time.ttl | grep -v '.*label="\\n\\nModel.*' | tee question-time.dot | dot -Tpng -o question-time.png

politics.png:
	rapper -i turtle -o dot politics.ttl | grep -v '.*label="\\n\\nModel.*' | tee politics.dot | dot -Tpng -o politics.png

hignfy.png:
	rapper -i turtle -o dot hignfy.ttl | grep -v '.*label="\\n\\nModel.*' | tee hignfy.dot | dot -Tpng -o hignfy.png

trip-to-italy.png:
	rapper -i turtle -o dot trip-to-italy.ttl | grep -v '.*label="\\n\\nModel.*' | tee trip-to-italy.dot | dot -Tpng -o trip-to-italy.png

doctor-who.png:
	rapper -i turtle -o dot doctor-who.ttl | grep -v '.*label="\\n\\nModel.*' | tee doctor-who.dot | dot -Tpng -o doctor-who.png

in-the-flesh.png:
	rapper -i turtle -o dot in-the-flesh.ttl | grep -v '.*label="\\n\\nModel.*' | tee in-the-flesh.dot | dot -Tpng -o in-the-flesh.png

happy-valley.png:
	rapper -i turtle -o dot happy-valley.ttl | grep -v '.*label="\\n\\nModel.*' | tee happy-valley.dot | dot -Tpng -o happy-valley.png

keepod.png:
	rapper -i turtle -o dot keepod.ttl | grep -v '.*label="\\n\\nModel.*' | tee keepod.dot | dot -Tpng -o keepod.png

keepod-tagged.png:
	rapper -i turtle -o dot keepod-tagged.ttl | grep -v '.*label="\\n\\nModel.*' | tee keepod-tagged.dot | dot -Tpng -o keepod-tagged.png

#question-time.ttl:
#	python url2rdf.py "http://www.bbc.co.uk/programmes/b006t1q9" >question-time.ttl

proposal:
	pdflatex proposal.tex

clean:
	rm -f *.log *.aux *~ *.bbl paper-dot2tex-* *.pdf *.png
