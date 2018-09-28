import xlrd
import numpy as np
from collections import OrderedDict
import json

key_type = ['int', '']

# get all the key from left to right
def get_key_name(worksheet):
    sh = worksheet.sheet_by_index(0)
    return sh.row_values(0)

# get the key type
def get_type_name_info(TypeNamePair):
    if "Arr" in TypeNamePair:
        spilted_list = TypeNamePair.split(':')
        demension_spilt = spilted_list[2:]
        return [spilted_list[0], spilted_list[1], demension_spilt]
    else:
        type_name_pair =  TypeNamePair.split('-')
        return type_name_pair
# get the value and covert it by type
def get_vaule(single_row_value_list):
    return single_row_value_list

# get the row by id
def get_row_by_id(worksheet, id):
    return worksheet.sheet_by_index(0).row_values(id)

# check if the id exits and is specific
def check_id_exsits(single_row):
    pass

def convert_data_to_json(value_type_list, value_list):
    ID = value_list[0]
    single_row_dic = OrderedDict()
    final_dic = OrderedDict()

    for type, value in zip(value_type_list[1:], value_list[1:]):
        type_name_info = get_type_name_info(type)
        if 'Arr' in type_name_info[0]:
            single_row_dic[type_name_info[1]] = get_format_array_data_list(
                type_name_info[0], type_name_info[2], len(type_name_info[2]), value
            )
        else:
            out = get_value_by_type(type_name_info[0])
            single_row_dic[type_name_info[1]] = out(value)

    final_dic[str(int(ID))] = single_row_dic
    return final_dic

# get format array data list
def get_format_array_data_list(type, array_char_list, dememsion_num,  value_list):
    out = get_value_by_type(type)
    if dememsion_num == 1:
        temp_list = array_char_list.spilt(array_char_list[0])
        data_list = []
        for ele in temp_list:
            data_list.append(out(ele))
        return data_list
    else:
        get_format_array_data_list(type, array_char_list[1:], dememsion_num-1, value_list)

# convert data to the right type
def get_value_by_type(datatype):
    def get_value(data):
        if datatype == 'string':
            return str(data)
        if datatype == 'int':
            return int(data)
        if datatype == 'bool':
            return str(data).lower()
        if datatype == 'float':
            return float(data)
        if datatype == 'double':
            return np.float64(data)
        if datatype == 'long':
            return int(data)
    return get_value



# worksheet = xlrd.open_workbook('test.xlsx')
# keyname_pair_list = get_key_name(worksheet)
# row_values_list = get_vaule(get_row_by_id(worksheet, 1))
# print(keyname_pair_list)
# print(row_values_list)
# sheet_dic_list = []
# sheet_dic_list.append(convert_data_to_json(keyname_pair_list, row_values_list))
# j = json.dumps(sheet_dic_list)

# with open('test.json', 'w' ) as f:
#     f.write(j)

