#/usr/bin/python3
import xlrd
import json
from collections import OrderedDict
from covertdata import *
from general import * 

create_project_dir('test')

worksheet = xlrd.open_workbook('test.xlsx')
sh = worksheet.sheet_by_index(0)

keyname_pair_list = get_key_name(sh)


sheet_dic_list = OrderedDict()
for row_index in range(1, sh.nrows): 
    row_values_list = get_row_list_by_id(worksheet, row_index)
    sheet_dic_list[str(int(row_values_list[0]))] = convert_data_to_json(keyname_pair_list, row_values_list)

j = json.dumps(sheet_dic_list)

create_json('test', 'test', j)
