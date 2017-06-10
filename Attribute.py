class Attribute:
    """
    Attribute class
    Information for each table attributes of a database graph
    """

    def __init__(self, name, var_type, is_pk, is_fk):
        self.name = name
        self.type = var_type
        self.is_pk = is_pk
        self.is_fk = is_fk

    def get_name(self):
        return self.name

    def get_type(self):
        return self.type

    def is_pk(self):
        return self.is_pk

    def is_fk(self):
        return self.is_fk
