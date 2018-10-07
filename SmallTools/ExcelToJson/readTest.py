import json

# read from string
json_data = open('./test/test.json').read()
data = json.loads(json_data)
print(data['1']['damage'])

# read from file
json_data_1 = open('./test/test.json')
data2 = json.load(json_data_1)
print(data2['1']['nameArr'])


