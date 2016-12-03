#!/bin/bash

# mvFile2Folder_1x0.sh


mydate=`date +%j --date='11/06/2016'`
echo $mydate



Delim='_'

MyStatus=9

InFile=`basename $1`



OutDBRoot=$2

# echo ${InFile} ${OutDBRoot}

Val=`echo ${InFile} | cut -d. -f1 |cut -d_ -f2,4`
echo $Val






exit ${MyStatus}




