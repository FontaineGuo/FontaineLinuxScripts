def get_format_list(data, arrchar):
    demension = len(arrchar)
    if demension == 1:
        return data.split(arrchar[0])
    else:
        res = []
        temp = data.split(arrchar[0])
        for index in range(0, len(temp)):
            res.append(get_format_list(temp[index], arrchar[1:]))
        return res


data = '1-2|3-4|5-6'
arrchar = ['|', '-']
print(arrchar)
res = get_format_list(data, arrchar)
print(res)


