from tulip import *
from SqlReader import *
from GraphView import *
import tulipplugins
import ntpath


class SQLImport(tlp.ImportModule):
  def __init__(self, context):
    tlp.ImportModule.__init__(self, context)
    self.addStringParameter("file::SQL script", "Script SQL you want to add in a graph")
    # You can add parameters to the plugin here through the following syntax:
    # self.add<Type>Parameter("<paramName>", "<paramDoc>", "<paramDefaultValue>")
    # (see the documentation of class tlp.WithParameter to see what parameter types are supported).

  def importGraph(self):
    filename = self.dataSet["file::SQL script"];
    name = ntpath.basename(filename)
    self.graph.setName(name)
    sql_reader = SqlReader(filename, self.graph)
    sql_reader.compute_diagram()
    g = GraphView(self.graph)
    g.set_view()    
 
    return True

# The line below does the magic to register the plugin into the plugin database
# and updates the GUI to make it accessible through the menus.
tulipplugins.registerPlugin("SQLImport", "Import SQL", "", "12/06/2017", "", "1.0")
