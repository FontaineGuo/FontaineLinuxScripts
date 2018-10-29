import cv2
import numpy as np
from general import *

# read the image
# in_file_lists = ['000001_in.png', '000002_in.png', '000003_in.png', '000004_in.png']
# out_file_lists = ['000001_out.png', '000002_out.png', '000003_out.png', '000004_out.png']


img1 = cv2.imread('./input/0001.jpg')
img2 = cv2.imread('./input/0002.jpg')

iamge = ImageSplice(img1, img2)
iamge2 = ImageSplice(img1, img2, Splice.Vertical)
cv2.imwrite('.\\test.png', iamge)
cv2.imwrite('.\\test2.png', iamge2)
# splice the image
# index = 1
# for left_img, right_img in zip(in_file_lists, out_file_lists):
#     img_1 = cv2.imread(left_img)
#     img_2 = cv2.imread(right_img)
#     # 上下拼接
#     image = np.concatenate((img_1, img_2), axis = 1)

#     # 左右拼接
#     # image = np.vstack((img_1, img_2))
#     # create new image
#     fileName = '.\\' + str(index) + '.png'
#     index = index+1
#     cv2.imwrite(fileName, image)