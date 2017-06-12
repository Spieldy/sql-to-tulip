from tulip import *

class Table(object):

    def __init__(self, node, graph):
        self.width = 0
        self.height = 0
        self.name = graph['table_name'][node]
        self.node = node
        self.graph = graph
        self.a_names = graph["a_name"][node]
        self.a_types = graph["a_type"][node]
        self.a_ispk = graph["a_ispk"][node]
        self.a_isfk = graph["a_isfk"][node]
        self.position = graph["viewLayout"][node]
        graph['viewColor'][node] = tlp.Color(224, 228, 204)

        self.width_per_character = 1
        self.h_offset = 0
        self.height_per_line = 2
        self.v_offset = 3
        
    def display(self):
      self.create_table_name()
      self.create_attribute_names()
      self.create_types()

    def compute_size(self):
        # width
        max_name = 0
        max_type = 0
        for i in range(len(self.a_names)):
          length = len(self.a_names[i])
          if length > max_name:
            max_name = length
          length = len(self.a_types[i])
          if length > max_type:
            max_type = length
        max_length = max(max_name + max_type, len(self.name) * 1.2)
        self.width = max_length * self.width_per_character + self.h_offset

        # height
        line_count = len(self.a_names) + 1
        self.height = line_count * self.height_per_line + self.v_offset
        
        self.graph['viewSize'][self.node] = tlp.Size(self.width, self.height, 1)

    def create_table_name(self):
        title_node = self.graph.addNode()
        self.graph['viewLabel'][title_node] = self.name
        self.graph['viewLayout'][title_node] = self.position + tlp.Vec3f(0, (self.height/2) + 0.5 - self.height_per_line, 1)
        self.graph['viewSize'][title_node] = tlp.Size(self.width, self.height_per_line * 2,1)
        self.graph['viewColor'][title_node] = tlp.Color(167, 219, 219)
        self.graph['viewFontSize'][title_node] = 38
        self.graph['viewFont'][title_node] = 'FreeMono bold'
        
    def create_attribute_names(self):
      for i in range(len(self.a_names)):
        a_node = self.graph.addNode()
        self.graph['viewLabel'][a_node] = ' ' + self.a_names[i]
        self.graph['viewLayout'][a_node] = self.position + tlp.Vec3f(1 - self.width/2, self.height/2 - (1 + self.height_per_line * (i + 2)), 1)
        self.graph['viewSize'][a_node] = tlp.Size(self.height_per_line / 2, self.height_per_line / 2,1)
        self.graph['viewFontSize'][a_node] = 24
        self.graph['viewColor'][a_node] = tlp.Color.Black
        self.graph['viewLabelPosition'][a_node] = 4
        if self.a_isfk[i] and self.a_ispk[i]:
          self.graph['viewShape'][a_node] = tlp.NodeShape.Diamond
        elif self.a_ispk[i]:
          self.graph['viewShape'][a_node] = tlp.NodeShape.Star
        elif self.a_isfk[i]:
          self.graph['viewLabelBorderWidth'][a_node] = 0
          self.graph['viewBorderWidth'][a_node] = 2
          self.graph['viewColor'][a_node] = tlp.Color(224, 228, 204)
          self.graph['viewShape'][a_node] = tlp.NodeShape.Diamond
        else:
          self.graph['viewLabelBorderWidth'][a_node] = 0
          self.graph['viewSize'][a_node] = tlp.Size(1,0,1)
        
    def create_types(self):
      max_name_size = 0
      for name in self.a_names:
        if len(name) > max_name_size:
          max_name_size = len(name)
      for i in range(len(self.a_types)):
        a_node = self.graph.addNode()
        self.graph['viewLabel'][a_node] = ' ' + self.a_types[i]
        self.graph['viewLayout'][a_node] = self.position + tlp.Vec3f(1-self.width/2 + (self.width_per_character * max_name_size), self.height/2 - (1 + self.height_per_line * (i + 2)), 1)
        self.graph['viewSize'][a_node] = tlp.Size(0, 1, 1)
        self.graph['viewFontSize'][a_node] = 24
        self.graph['viewLabelColor'][a_node] = tlp.Color.Gray
        self.graph['viewColor'][a_node] = tlp.Color(224, 228, 204)
        self.graph['viewLabelPosition'][a_node] = 4
        if self.a_ispk[i]:
          self.graph['viewLabelBorderWidth'][a_node] = 1
          self.graph['viewLabelBorderColor'][a_node] = tlp.Color.Gray
        else:
          self.graph['viewLabelBorderWidth'][a_node] = 0
        
def main(graph): 
  for n in graph.getNodes():
    t = Table(n, graph)
    t.display()
