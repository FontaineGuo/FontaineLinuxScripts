import xlrd
import numpy as np

key_type = ['int', '']

# get all the key from left to right
def get_key_name(worksheet):
    sh = worksheet.sheet_by_index(0)
    return sh.row_values(0)

# get the key type
def get_value_type(TypeNamePair):
    print(TypeNamePair)
    if "Arr" in TypeNamePair:
        # print('The type is ' + TypeNamePair.split('Arr')[0])
        spilted_list = TypeNamePair.split(':')
        demension_spilt = spilted_list[2:]
        # print('There are ' +  str(len(demension_spilt)) + ' demensions in array')
        # TODO: return array model
        return [TypeNamePair.split('Arr')[0], spilted_list[1], len(demension_spilt)]
    else:
        type_name_pair =  TypeNamePair.split('-')
        #print('The type is ' + type_name_pair[0])
        #print('The name is ' + type_name_pair[1])
        return type_name_pair
# get the value and covert it by type
def get_vaule(single_row_value_list):
    return single_row_value_list[1:]

# get the row by id
def get_row_by_id(id):
    return worksheet.sheet_by_index(0).row_values(id)

# check if the id exits and is specific
def check_id_exsits(single_row):
    pass





worksheet = xlrd.open_workbook('test.xlsx')
key_list = get_key_name(worksheet)
print(type(key_list))
for key in key_list:
    if key != 'ID':
        print(get_value_type(key))
        print('\n')
print(get_vaule(get_row_by_id(1)))


