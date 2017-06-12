from SqlReader import *
from TableView import *
from GraphView import *
from tulip import *


def main(graph):
    clean(graph)
    path = 'C:/Users/Theo/PycharmProjects/sql-to-tulip/exemples_sql/tetrum.sql'
    SqlReader(path, graph)
    g = GraphView(graph)
    g.set_view()


def clean(graph):
    for e in graph.getEdges():
        graph.delEdge(e)
    for n in graph.getNodes():
        graph.delNode(n)
