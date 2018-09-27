import os

# create project dir   
def create_project_dir(directory):
    if not os.path.isdir(directory):
        print("creating project " + directory)
        os.mkdir(directory)

# create json
def create_json(project_name, excel_name, data):
    file_name = project_name + '/' +  excel_name + '.json'

    with open(file_name, 'w' ) as f:
         f.write(data)



# delete file content
def delete_file_content(path):
    with open(path):
        pass


