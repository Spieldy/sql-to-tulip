from SqlReader import *
from tulip import *


def main(graph):
    path = 'C:/Users/Pierre-Louis/Documents/UQAC/Cours/Visualisation/sql-to-tulip/exemples_sql/correctx.sql'
    sql_r = SqlReader(path, graph)
    
    for n in graph.getNodes():
        print n
