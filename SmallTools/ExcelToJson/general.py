import os


def create_project_dir(directory):
    if not os.path.isdir(directory):
        print("creating project")
        os.mkdir(directory)


def create_json(project_name, excel_name):
    file_name = project_name + 'excel_name.json'

    if not os.path.isfile(file_name):
        write_file(file_name, '')

def write_file(path, data):
    f = open(path)
    f.write(data)
    f.close()
