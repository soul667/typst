# 读取图片"D:\Data\typst\保研\cv.typ-main\img\证件照.jpg.副本""，并压缩输出
import cv2
import numpy as np

img = cv2.imread(r"D:\Data\typst\保研\cv.typ-main\img\证件照.jpg")
imshow = cv2.resize(img, (0, 0), fx=0.5, fy=0.5)
cv2.imshow("img", imshow)
cv2.waitKey(0)