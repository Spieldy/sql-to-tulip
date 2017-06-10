import re


class SqlReader:
    path = ''
    graph = []

    def __init__(self, path):
        self.path = path

    def compute_diagram(self):
        """
        Read the SQL class and create the corresponding entities-diagram graph
        """
        with open(self.path, 'r') as my_file:
            file = my_file.read().replace('\n', '')
        file = self.indent_file(file)
        # self.create_nodes(file)
        self.add_keys(file)
        # self.create_edges(file)
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

    def create_nodes(self, file):
        """
        Create the nodes corresponding to SQL tables
        Based on 'CREATE TABLE' sentences
        :param file: The SQL file
        """
        ct_expression = r'CREATE TABLE[\s]*`([\S]*)`[\s]*\((.*)\)[=\s\w\d]*;'
        args_expression = r'(`([\S]*)`[\s]*([\S]*)[\s\w]*)[,]*'
        ct_results = re.finditer(ct_expression, file)
        for ct_result in ct_results:
            table_name = ct_result.group(1)
            print(table_name)
            args_results = re.finditer(args_expression, ct_result.group(2))
            for arg in args_results:
                column_id = arg.group(2)
                column_type = arg.group(3)
                print('   ' + column_id + ': ' + column_type)
        # todo creer les Node correspondants

    def add_keys(self, file):
        """
        Add primary and foreign keys
        Based on 'ALTER TABLE' sentences
        :param file: The SQL file
        """
        at_expression = r'ALTER TABLE[\s]*`([\S]*)`[\s]*(.*)[=\s\w\d]*;'
        pk_expression = r'ADD PRIMARY KEY \(`([\S]*)`\)'
        fk_expression = r'ADD CONSTRAINT `[\S]*`[\s]*FOREIGN KEY \(`([\S]*)`\)'
        at_results = re.finditer(at_expression, file)
        for at_result in at_results:
            table_name = at_result.group(1)
            print('table : ' + table_name)

            # primary keys
            pk_results = re.finditer(pk_expression, at_result.group(2))
            for pk in pk_results:
                primary_key = pk.group(1)
                print('  primary key : ' + primary_key)

            # foreign keys
            fk_results = re.finditer(fk_expression, at_result.group(2))
            for fk in fk_results:
                foreign_key = fk.group(1)
                print('  foreign key : ' + foreign_key)
        # todo ajouter les infos aux Nodes correspondants

    def create_edges(self, file):
        """
        Create the edges corresponding to SQL foreign keys
        Based on 'ALTER TABLE' sentences
        :param file: The SQL file
        """
        at_expression = r'ALTER TABLE[\s]*`([\S]*)`[\s]*(.*)[=\s\w\d]*;'
        args_expression = \
            r'ADD CONSTRAINT `[\S]*`[\s]*FOREIGN KEY \(`([\S]*)`\)[\s]*REFERENCES[\s]*([\S]*)[\s]*\(`([\S]*)`\)'
        at_results = re.finditer(at_expression, file)
        for at_result in at_results:
            table_1_name = at_result.group(1)
            args_results = re.finditer(args_expression, at_result.group(2))
            for arg in args_results:
                print('table 1 : ' + table_1_name)
                table_1_key = arg.group(1)
                print('    key 1 : ' + table_1_key)
                table_2_name = arg.group(2)
                print('  table 2 : ' + table_2_name)
                table_2_key = arg.group(3)
                print('    key 2 : ' + table_2_key)
        # todo creer les Edges correspondants
