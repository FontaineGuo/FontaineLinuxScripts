#This could move photo to the specific folder based on its DateTimeOriginal

import shutil
import os
import stat
import time
from PIL import Image

def getDate(filename):
    try:
        fd = Image.open(filename)
    except:
        raise "unopen file[%s]\\n" % filename 
    try:
        data = fd._getexif()
        if data:
            #get time
            try:
                t = data['EXIF DateTimeOriginal']
                #transfer time format into  yyyy-mm-dd 的格式
                return str(t).replace(":","-")[:10]
            except:
                pass
        #if not get exif ，use its created time as DateTimeOriginal
        state = os.stat(filename)
        return time.strftime("%Y-%m-%d", time.localtime(state[-2]))
    except:
        return 0


def showFileProperties(path, tempfolder):
    '''显示文件的属性。包括路径、大小、创建日期、最后修改时间，最后访问时间'''
    import time,os
    #go through every file of dir
    for root,dirs,files in os.walk(path,True):
        dirs[:] = []
        # print the root 
        print("位置：" + root)
        for filename in files:
            filename = os.path.join(root, filename)
            #if not 'jpg','png' , ignore it
            f,e = os.path.splitext(filename)
            if e.lower() not in ('.jpg','.png'):
                continue   
            #get DateTimeOriginal
            t = getDate( filename )
            if t != 0:
                t = t[:7]
                pwd = root + '\\' + t
                dst = pwd + '\\' + os.path.basename(filename)
                print("Move " + filename + "   to   " + dst )
                if not os.path.exists(pwd):
                    os.mkdir(pwd)
                    shutil.copy2(filename, dst)
                else:
                    shutil.copy2(filename, dst)
            else:
                shutil.copy2(filename, tempfolder)


if __name__ == "__main__":
    path = "."
    tempfolder = '.\\未知时间'
    if not os.path.exists(tempfolder):
                os.mkdir(tempfolder)
    showFileProperties(".\\", tempfolder)