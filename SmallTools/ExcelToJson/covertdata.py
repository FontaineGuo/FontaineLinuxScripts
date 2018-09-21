import xlrd


# get all the key from left to right
def get_key_name(worksheet):
    sh = worksheet.sheet_by_index(0)
    return sh.row_values(0)

# get the key type
def get_value_type(TypeNamePair):
    print(TypeNamePair.split('-',1))
# get the value and covert it by type

# get the json key-pair

worksheet = xlrd.open_workbook('test.xlsx')
key_list = get_key_name(worksheet)
print(key_list)
print(type(key_list[1]))


