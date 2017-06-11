from tulip import *

class Table(object):

    def __init__(self, node, graph):
        self.width = 0
        self.height = 0
        self.name = graph['table_name'][node]
        self.node = node
        self.graph = graph
        self.a_names = graph["a_names"][node]
        self.a_types = graph["a_types"][node]
        self.a_ispk = graph["a_ispk"][node]
        self.a_isfk = graph["a_isfk"][node]
        self.position = graph["viewLayout"][node]

        self.width_per_character = 1
        self.h_offset = 2
        self.height_per_line = 2
        self.v_offset = 2
        self.display()
        
    def display(self):
      self.compute_size()
      self.create_table_name()
      self.create_attribute_names()

    def compute_size(self):
        # width
        max_length = len(self.name)
        for i in range(len(self.a_names)):
            length = len(self.a_names[i]) + len(self.a_types[i])
            if length > max_length:
                max_length = length
        self.width = max_length * self.width_per_character + self.h_offset

        # height
        line_count = len(self.a_names) + 1
        self.height = line_count * self.height_per_line + self.v_offset
        
        self.graph['viewSize'][self.node] = tlp.Size(self.width, self.height, 1)

    def create_table_name(self):
        title_node = self.graph.addNode()
        self.graph['viewLabel'][title_node] = self.name
        self.graph['viewLayout'][title_node] = self.position + tlp.Vec3f(0, self.height/2 - 1, 1)
        self.graph['viewSize'][title_node] = tlp.Size(self.width, self.height_per_line,1)
        self.graph['viewColor'][title_node] = tlp.Color(tlp.Color.Periwinkle)
        self.graph['viewFontSize'][title_node] = 32
        self.graph['viewFont'][title_node] = 'FreeMono bold'
        
    def create_attribute_names(self):
      for i in range(len(self.a_names)):
        a_node = self.graph.addNode()
        self.graph['viewLabel'][a_node] = ' ' + self.a_names[i]
        self.graph['viewLayout'][a_node] = self.position + tlp.Vec3f(1-self.width/2, self.height/2 - (4 + self.height_per_line * i), 1)
        self.graph['viewSize'][a_node] = tlp.Size(self.height_per_line / 2, self.height_per_line / 2,1)
        self.graph['viewFontSize'][a_node] = 24
        self.graph['viewShape'][a_node] = tlp.NodeShape.Ring
        self.graph['viewColor'][a_node] = tlp.Color.Black
        self.graph['viewLabelPosition'][a_node] = 4