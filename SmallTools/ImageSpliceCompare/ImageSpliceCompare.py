import cv2
import numpy as np

# read the image
in_file_lists = ['000001_in.png', '000002_in.png', '000003_in.png', '000004_in.png']
out_file_lists = ['000001_out.png', '000002_out.png', '000003_out.png', '000004_out.png']

# splice the image
index = 1
for left_img, right_img in zip(in_file_lists, out_file_lists):
    img_1 = cv2.imread(left_img)
    img_2 = cv2.imread(right_img)
    # 上下拼接
    image = np.concatenate((img_1, img_2), axis = 1)

    # 左右拼接
    # image = np.vstack((img_1, img_2))
    # create new image
    fileName = '.\\' + str(index) + '.png'
    index = index+1
    cv2.imwrite(fileName, image)