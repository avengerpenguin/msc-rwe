pdf: question-time.dot politics.dot keepod.dot keepod-tagged.dot basic-ontology.dot expiring-ontology.dot recommended-ontology.dot
	pdflatex --shell-escape paper.tex
	bibtex paper.aux
	pdflatex --shell-escape paper.tex
	pdflatex --shell-escape paper.tex
	@echo "Word counts:"
	@echo "Chapter 1: `sh wordcount.sh chapter1*.tex`\t/   500 -   750"
	@echo "Chapter 2: `sh wordcount.sh chapter2*.tex`\t/  1500 -  2250"
	@echo "Chapter 3: `sh wordcount.sh chapter3*.tex`\t/  2500 -  3750"
	@echo "Chapter 4: `sh wordcount.sh chapter4*.tex`\t/  2500 -  3750"
	@echo "Chapter 5: `sh wordcount.sh chapter5*.tex`\t/  2500 -  3750"
	@echo "Chapter 6: `sh wordcount.sh chapter6*.tex`\t/   500 -   750"
	@echo "Total    : `sh wordcount.sh paper.tex chapter*.tex`/ 10000 - 15000"
	@python -c "print 100 * `sh wordcount.sh paper.tex chapter*.tex` / 10000, '%'"
	@python -c "print 100 * `sh wordcount.sh paper.tex chapter*.tex` / 15000, '%'"

question-time.dot: question-time.ttl
	rapper -i turtle -o dot question-time.ttl \
	  | grep -v '.*label="\\n\\nModel.*' >question-time.dot

politics.dot: politics.ttl
	rapper -i turtle -o dot politics.ttl \
	  | grep -v '.*label="\\n\\nModel.*' >politics.dot 

keepod.dot: keepod.ttl
	rapper -i turtle -o dot keepod.ttl \
	  | grep -v '.*label="\\n\\nModel.*' >keepod.dot

keepod-tagged.dot: keepod-tagged.ttl
	rapper -i turtle -o dot keepod-tagged.ttl \
	  | grep -v '.*label="\\n\\nModel.*' >keepod-tagged.dot

basic-ontology.dot: basic-ontology.ttl
	rapper -i turtle -o dot basic-ontology.ttl \
	  | grep -v '.*label="\\n\\nModel.*' >basic-ontology.dot

expiring-ontology.dot: expiring-ontology.ttl
	rapper -i turtle -o dot expiring-ontology.ttl \
	  | grep -v '.*label="\\n\\nModel.*' >expiring-ontology.dot

recommended-ontology.dot: recommended-ontology.ttl
	rapper -i turtle -o dot recommended-ontology.ttl \
	  | grep -v '.*label="\\n\\nModel.*' >recommended-ontology.dot

#question-time.ttl:
#	python url2rdf.py "http://www.bbc.co.uk/programmes/b006t1q9" >question-time.ttl

proposal:
	pdflatex proposal.tex

clean:
	rm -f *.log *.aux *~ *.bbl paper-dot2tex-* *.pdf *.dot
