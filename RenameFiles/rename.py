import os
import re

sPath = "D:\\3_Unterhaltung\\Serien\\Assassination Classroom\\S1"
lFiles = os.listdir(sPath)
lFiles.sort()

for file in lFiles:
    result = re.search(r'^.+[sS]{1}(\d{1,2})[eEpP]{1,2}(\d{1,2}).*(\.\w{3,4}$)', file)
    if result:
        season = result.group(1)
        episode = result.group(2)
        suffix = result.group(3)
    BeneSux = "S"+season.zfill(2)+"E"+episode.zfill(2)+suffix
    print("Old: " +file +" New: " +BeneSux)
    close = input()
    if close == "break":
        exit()
    else:
        os.rename(sPath+'\\'+file, sPath+'\\'+BeneSux)
    


    #^.+[sS]{1}\s*(\d{1,2})\s*\-\s*[eEpP]{1,2}\s*(\d{1,2}).*(\.\w{3,4}$)
    #^.+[sS]{1}(\d{1,2})[eEpP]{1,2}(\d{1,2}).*(\.\w{3,4}$)