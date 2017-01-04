#!/bin/bash

ProgramName="MakeKmlTrack_1x0.sh"

# Richard David Conover
#  12/29/2016

# This program will create a KML track of a specified GPS device
# based on a start time and end-time based on the tracks recorded
# in the GPS database for the device.

# Copy a set of GPS files, selected by the GPS device serial-number
# from the source folder to the desination folder, as specified on the command
# line. 

# Rule 1: If the GPS files have the same 'TimeStamp': use the larger.
# Rule 2: If the Current Month is less that GPS month, adjust the Year-TimeStamp
# Rule 3: Only copy files that are within the TimeWindow

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if [ ${#} -ne 5 ]
then  
  echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
  echo "Incorrect argument list"
  echo "Example: ${ProgramName} GpsSrcFilePath GpsDestFilePath GPS_Serial S_YYMMDDHH E_YYMMDDHH"
  echo "         GPS_Serial = GPS Device Serial Number"
  echo "         S_YYMMDDHR = Start Year Month Day Hour (S_16110906) 2016-Nov-09-06a"
  echo "         E_YYMMDDHR =   End Year Month Day Hour (E_16123123) 2016-Dec-09-11p"
  echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
  exit 9
fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
BeNoisy=${TRLS_NOISY}
BeNoisy=0

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Capture the input data parameters
GpsSrcFilePath=${1}
GpsDestFilePath=${2}
GpsSerialNum=${3}
S_YYMMDDHH=${4} 
E_YYMMDDHH=${5}
FilesCopies=0
SN_Hash=0
DB_BaseDir=""
GPS_Count=0

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Code to calculate the SerialPath for this entry
echo ${GpsSerialNum}

#SN_Hash=`echo -n "${GpsSerial}"|md5sum`
SN_Hash=`echo -n "${GpsSerialNum}"|md5sum`
#echo "SN_Hash = ${SN_Hash}"

SN_Hash_MS8=`echo ${SN_Hash} | cut -c 5-12`
echo "SN_Hash_MS8 = ${SN_Hash_MS8}"
SN_Hash_Use=`echo ${SN_Hash_MS8} | cut -c 7`

echo "SN_Hash_Use = ~${SN_Hash_Use}~"

DB_FileDirectory=`echo "0${SN_Hash_Use}"`

DB_FileDirectory="${GpsSrcFilePath}/0${SN_Hash_Use}"
echo "DB_FileDirectory = ${DB_FileDirectory}"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#Flist=`find ${DB_FileDirectory} |grep ".txt"`

DirList=`ls -d ${DB_FileDirectory}/*`


echo $DirList




for DirName in `echo ${DirList}|sort`; 
do 
    echo $DirName
    echo "${GpsDestFilePath} ${GpsSerialNum} ${S_YYMMDDHH} ${E_YYMMDDHH}"

    cpFolder2Folder_1x0.sh ${DirName} ${GpsDestFilePath} ${GpsSerialNum} ${S_YYMMDDHH} ${E_YYMMDDHH}
    #if [$?]; then
     # GPS_Count++
    #fi
done



if [ ${GPS_Count} -gt 0 ]; then
    Rval=0


else
  Rval=99
fi

exit ${Rval}






