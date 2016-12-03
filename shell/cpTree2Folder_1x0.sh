#!/bin/bash

ver="1x0"

NameFilter=${1-"*.txt"}
RootPath=${2-"/home/richard/trails/db/"}
OutPath=${3-"/home/richard/trails/tmp"}
Ret=9

#echo ${RootPath}
#echo ${NameFilter}
#echo ${OutPath}

#find /home/shantanu/processed/ -name '*2011*.xml' -exec cp {} /home/shantanu/tosend  \;
#find /home/richard/trails/db/ -name '*.txt' -exec cp {} /home/richard/junk  \;

# find /home/shantanu/processed/ -name '*2011*.xml' -exec cp {} /home/shantanu/tosend  \;

#cpTree2Folder_1x0.sh find /home/shantanu/processed/ -name '*2011*.xml' -exec cp {} /home/shantanu/tosend  \;

#echo "

echo "find ${RootPath} -name '${NameFilter}' -exec cp {} ${OutPath}  \;"

# find ${RootPath} -name '${NameFilter}' -exec cp {} ${OutPath}  \;

find ${RootPath} -name "${NameFilter}" -exec cp {} ${OutPath} \;





Ret=$?

exit ${Ret}
