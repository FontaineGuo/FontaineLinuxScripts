#/usr/bin/python3
import xlrd
import json
from collections import OrderedDict
from covertdata import *
from general import * 

create_project_dir('test')

worksheet = xlrd.open_workbook('test.xlsx')

keyname_pair_list = get_key_name(worksheet)
row_values_list = get_vaule(get_row_by_id(worksheet, 1))

sheet_dic_list = []
sheet_dic_list.append(convert_data_to_json(keyname_pair_list, row_values_list))

j = json.dumps(sheet_dic_list)

create_json('test', 'test', j)
