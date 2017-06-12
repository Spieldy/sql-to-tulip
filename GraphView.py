from tulip import *
from TableView import *

class GraphView(object):
  
  def __init__(self, graph):
    self.graph = graph
    
  def set_view(self):
    self.compute_sizes()
    self.set_edges()
    self.graph.applyLayoutAlgorithm('Planarization Layout (OGDF)')
    self.set_tables()
    
  def compute_sizes(self):
    for n in self.graph.getNodes():
      t = TableView(n, self.graph)
      t.compute_size()
 
  def set_edges(self):
    for e in self.graph.getEdges():
      self.graph['viewSize'][e] = tlp.Size(1, 1, 1)
      #self.graph['viewColor'][e] = tlp.Color(243, 134, 48)
      
  def set_tables(self):
    for n in self.graph.getNodes():
        t = TableView(n, self.graph)
        t.compute_size()
        t.display()
