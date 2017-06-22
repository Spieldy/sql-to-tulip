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
        #self.set_properties()

    def compute_sizes(self):
        for n in self.graph.getNodes():
            t = TableView(n, self.graph)
            t.compute_size()

    def set_edges(self):
        for e in self.graph.getEdges():
            self.graph['viewSize'][e] = tlp.Size(1, 1, 1)

    def set_tables(self):
        for n in self.graph.getNodes():
            t = TableView(n, self.graph)
            t.compute_size()
            t.display()

    def set_properties(self):
        #should work, but it does not...
        for v in tlpgui.getOpenedViews():
            if isinstance(v, tlpgui.NodeLinkDiagramComponent):
                params = v.getRenderingParameters()
                params.setLabelFixedFontSize(True)
                params.setEdgeSizeInterpolate(False)
