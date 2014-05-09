import sys
import rdflib
from rdflib.tools.rdf2dot import rdf2dot

g = rdflib.Graph()
for url in sys.argv[1:]:
    g.parse(url)

    if 'http://www.bbc.co.uk/programmes/' in url and '.rdf' not in url:
        g.parse(url + '.rdf')

    for subject in g.subjects():
        if 'http://www.bbc.co.uk/programmes/' in subject and '.rdf' not in subject:
            g.add((rdflib.URIRef(subject), rdflib.URIRef('http://xmlns.com/foaf/0.1/primaryTopic'), rdflib.URIRef(subject + '#programme')))

g.bind('bbcprog', 'http://www.bbc.co.uk/programmes/')

[g.remove((s, p, o))
 for s, p, o in g
 if p == rdflib.URIRef(u'http://www.w3.org/1999/xhtml/vocab#role') or o == rdflib.URIRef('http://www.w3.org/1999/02/22-rdf-syntax-ns#nil') ]

#print g.serialize(format='turtle')

print rdf2dot(g, sys.stdout)
