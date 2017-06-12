from SqlReader import *
from TableView import *
from tulip import *


def main(graph):
    reinit(graph)
    path = 'C:/Users/Theo/PycharmProjects/sql-to-tulip/exemples_sql/tetrum.sql'
    sql_r = SqlReader(path, graph)
    
    for n in graph.getNodes():
        t = Table(n, graph)
        t.compute_size()

    graph.applyLayoutAlgorithm('Planarization Layout (OGDF)')

    for n in graph.getNodes():
        t = Table(n, graph)
        t.compute_size()
        t.display()


def reinit(graph):
    for e in graph.getEdges():
        graph.delEdge(e)
    for n in graph.getNodes():
        graph.delNode(n)
