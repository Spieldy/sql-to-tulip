from SqlReader import *


def main():
    path = './exemple_sql.sql'
    sql_r = SqlReader(path)
    sql_r.compute_diagram()

if __name__ == '__main__':
    main()
