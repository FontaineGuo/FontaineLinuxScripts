import os
import numpy as np
from enum import Enum

Splice=Enum('Splice', ('Horizontal', 'Vertical'))

# create output dir
def create_dir(directory):
    if not os.path.isdir(directory):
        print("createing dir " + dir)
        os.mkdir(directory)

# delete file contet:
def delete_file_content(path):
    with open(path):
        pass


# ImageSplice
def ImageSplice(image1, image2, spliceway=Splice.Horizontal):
    # check the array type 
    if type(image1) != np.ndarray:
        print('image1 must be a numpy.ndarray')
        exit()
    if type(image2) != np.ndarray:
        print('image2 must be a numpy.ndarray')
        exit()
    if spliceway == Splice.Horizontal:
        #image = np.concatenate((image1, image2), axis = 1)
        image = np.hstack((image1, image2))
    else:
        image = np.vstack((image1, image2))
    return image

