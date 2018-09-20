import os

# create project dir   
def create_project_dir(directory):
    if not os.path.isdir(directory):
        print("creating project")
        os.mkdir(directory)

# create json
def create_json(project_name, excel_name):
    file_name = project_name + '/' +  excel_name + '.json'

    if not os.path.isfile(file_name):
        write_file(file_name, '')

# write file 
def write_file(path, data):
    f = open(path, 'w')
    f.write(data)
    f.close()

# delete file content
def delete_file_content(path):
    with open(path):
        pass


