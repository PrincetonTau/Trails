#!/bin/bash

ver="1x1"

NameFilter=${1-"*.txt"}
RootPath=${2-"/home/richard/trails/db/"}
OutPath=${3-"/home/richard/trails/tmp"}
Ret=9

find ${RootPath} -name "${NameFilter}" -exec cp {} ${OutPath} \;
Ret=$?

exit ${Ret}
