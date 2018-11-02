import cv2
import numpy as np
import os

# read the image
in_file_lists = os.listdir('./input')
out_file_lists = os.listdir('./output')


# splice the image
index = 1
for left_img, right_img in zip(in_file_lists, out_file_lists):
    img_1 = cv2.imread('./input/' + left_img)
    img_2 = cv2.imread('./output/' + right_img)
    # 上下拼接
    print('processing the ' + str(index) + ' image')
    image = np.concatenate((img_1, img_2), axis = 1)

    # 左右拼接
    # image = np.vstack((img_1, img_2))
    # create new image
    fileName = '.\\' + str(index) + '.png'
    index = index+1
    cv2.imwrite(fileName, image)