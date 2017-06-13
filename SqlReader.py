import re
from tulip import *
from GraphUtils import *


class SqlReader:
    """
    SqlReader class
    Read a SQL database creation file and create a corresponding graph
    """
    path = ''

    def __init__(self, path, graph):
        self.path = path
        self.graph = graph

    def compute_diagram(self):
        """
        Read the SQL class and create the corresponding entities-diagram graph
        :return: The database graph
        """
        with open(self.path, 'r') as my_file:
            file = my_file.read().replace('\n', ' ')
        file = self.indent_file(file)
        self.delete_nodes(file)
        self.create_nodes(file)
        self.add_keys(file)
        self.create_edges(file)
        # todo call to other functions
        my_file.close()

    def indent_file(self, file):
        """
        Set every instruction at the beginning of each line
        :param file: The SQL file
        :return: The SQL file indented
        """
        # todo add every SQL instruction
        return file\
            .replace('CREATE TABLE', '\nCREATE TABLE')\
            .replace('ALTER TABLE', '\nALTER TABLE')\
            .replace('DROP TABLE', '\nDROP TABLE')

    def delete_nodes(self, file):
        """
        Delete the nodes corresponding to SQL tables
        Based on 'DROP TABLE' sentences
        :param file: The SQL file
        """
        dt_expression = r'DROP TABLE IF EXISTS[\s]*`([\S]*)`[\s]*;'
        dt_results = re.finditer(dt_expression, file)
        for dt_result in dt_results:
            table_name = dt_result.group(1)
            node = get_node_by_attribute_value(self.graph, 'table_name', table_name)
            if node:
                self.graph.delNode(node)

    def create_nodes(self, file):
        """
        Create the nodes corresponding to SQL tables
        Based on 'CREATE TABLE' sentences
        :param file: The SQL file
        """
        ct_expression = r'CREATE TABLE[\s\S]*?`([\S]*)`[\s]*\((.*)\)[=\s\w\d]*;'
        args_expression = r'(`([\S]*)`[\s]*([\S]*)[\s\w]*)[,]*'
        ct_results = re.finditer(ct_expression, file)
        for ct_result in ct_results:
            names = []
            types = []
            table_name = ct_result.group(1)
            node = get_node_by_attribute_value(self.graph, 'table_name', table_name)
            if not node:
                node = self.graph.addNode()
                self.graph['table_name'][node] = table_name
                args_results = re.finditer(args_expression, ct_result.group(2))
                for arg in args_results:
                    column_id = arg.group(2)
                    names.append(column_id)
                    column_type = arg.group(3)
                    types.append(column_type)
                self.graph['a_name'][node] = names
                self.graph['a_type'][node] = types

    def add_keys(self, file):
        """
        Add primary and foreign keys
        Based on 'ALTER TABLE' sentences
        :param file: The SQL file
        """
        for n in self.graph.getNodes():
            number_of_attributes = len(self.graph['a_name'][n])
            self.graph['a_ispk'][n] = [False] * number_of_attributes
            self.graph['a_isfk'][n] = [False] * number_of_attributes

        at_expression = r'ALTER TABLE[\s]*`([\S]*)`[\s]*(.*)[=\s\w\d]*;'
        pk_expression = r'ADD PRIMARY KEY \(`([\S]*)`\)'
        pk_sub_expression = r'([\S]*?)(`,`|$)'
        fk_expression = r'ADD CONSTRAINT `[\S]*`[\s]*FOREIGN KEY \(`([\S]*)`\)'
        at_results = re.finditer(at_expression, file)
        for at_result in at_results:
            table_name = at_result.group(1)
            node = get_node_by_attribute_value(self.graph, 'table_name', table_name)

            pk_list = self.graph['a_ispk'][node]
            fk_list = self.graph['a_isfk'][node]

            # primary keys
            pk_results = re.finditer(pk_expression, at_result.group(2))
            for pk_result in pk_results:
                p_keys = re.finditer(pk_sub_expression, pk_result.group(1))
                for p_key in p_keys:
                    if p_key.group(1):
                        primary_key = p_key.group(1)
                        pk_pos = get_position_by_node_attribute_value(self.graph, node, 'a_name', primary_key)
                        pk_list[pk_pos] = True
            self.graph['a_ispk'][node] = pk_list

            # foreign keys
            fk_results = re.finditer(fk_expression, at_result.group(2))
            for fk in fk_results:
                foreign_key = fk.group(1)
                fk_pos = get_position_by_node_attribute_value(self.graph, node, 'a_name', foreign_key)
                fk_list[fk_pos] = True
            self.graph['a_isfk'][node] = fk_list

    def create_edges(self, file):
        """
        Create the edges corresponding to SQL foreign keys
        Based on 'ALTER TABLE' sentences
        :param file: The SQL file
        """
        at_expression = r'ALTER TABLE[\s]*`([\S]*)`[\s]*(.*)[=\s\w\d]*;'
        args_expression = \
            r'ADD CONSTRAINT `[\S]*`[\s]*FOREIGN KEY \(`([\S]*)`\)[\s]*REFERENCES[\s]*`([\S]*)`[\s]*\(`([\S]*)`\)'
        at_results = re.finditer(at_expression, file)
        for at_result in at_results:
            table_1_name = at_result.group(1)
            node1 = get_node_by_attribute_value(self.graph, 'table_name', table_1_name)
            args_results = re.finditer(args_expression, at_result.group(2))
            for arg in args_results:
                # table_1_key = arg.group(1)
                table_2_name = arg.group(2)
                node2 = get_node_by_attribute_value(self.graph, 'table_name', table_2_name)
                # table_2_key = arg.group(3)
                self.graph.addEdge(node1, node2)
