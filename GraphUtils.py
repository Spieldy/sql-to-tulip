from tulip import *


def get_node_by_attribute_value(graph, attribute, value):
    for node in graph.getNodes():
        if graph[attribute][node] == value:
            return node
    return False


def get_position_by_node_attribute_value(graph, node, attribute, value):
    attribute_list = graph[attribute][node]
    i = 0
    for element in attribute_list:
        if element == value:
            return i
        i += 1
    return False
