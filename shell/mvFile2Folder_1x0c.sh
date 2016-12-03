#!/bin/bash

ProgramName="mvFile2Folder_1x0c.sh"
# Richard David Conover
#  11/28/2016



# Move the specifid GPS File 

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if [ ${#} -ne 2 ]
then
  echo "Incorrect argument list"
  echo "Example: ${ProgramName} GpsSrcFilePath DbRootPath"
  exit 9
fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# - - - - - - - - Program Constants - - - - - - - - - - - - - -
Delim='_'
MyStatus=9

# Location of the input GPS file
InPath=${1}
InFile=`basename ${InPath}`

# Location of the DB_ROOT where the file is to be placed
OutDbRoot=$2
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#Get the current "Clock Time" of the server
DateToday=`date +%m_%d_%y`
ThisMonth=`echo ${DateToday} | cut -d_ -f1`
ThisDay=`echo ${DateToday} | cut -d_ -f2`
ThisYear=`echo ${DateToday} | cut -d_ -f3`
YearStamp=${ThisYear}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
ThisMonthDay="${ThisMonth}${ThisDay}"

#Get the GPS Serial Number  field from the GPS file
GpsSerialNum=`echo ${InFile} | cut -d_ -f1`
echo "GPS Serial Number = ${GpsSerialNum}"


#Get the MonthDay field from the GPS file
FileMonthDay=`echo ${InFile} | cut -d. -f1|cut -d_ -f2`
echo "FileMonthDay = ${FileMonthDay}"

#Check for a 'Time Wrap' where GPS is later than the current time
if [ ${FileMonthDay} -gt ${ThisMonthDay} ]
then
  #echo "Year wrap error"
  YearStamp=$[YearStamp -1]
fi

FileMonthDay=`echo ${InFile} | cut -d. -f1|cut -d_ -f2`

MyFileDate1=`date +%j --date=${YearStamp}${FileMonthDay}`
#echo "Directory = ${YearStamp}${MyFileDate1}"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - -


# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Code to calculate the FilePath for this entry
SN_Hash=`echo -n "${GpsSerialNum}"|md5sum`
echo "SN_Hash = ${SN_Hash}"

SN_Hash_MS8=`echo ${SN_Hash} | cut -c 5-12`
echo "SN_Hash_MS8 = ${SN_Hash_MS8}"

SN_Hash_Use=`echo ${SN_Hash_MS8} | cut -c 7`
DB_FileDirectory=`echo "0${SN_Hash_Use}"`
echo "DB_FileDirectory = ${DB_FileDirectory}"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - -

InSrcPath=${InPath}
MoveToPath="${OutDbRoot}/${DB_FileDirectory}/"

echo "InSrcPath = ${InSrcPath} MoveToPath = ${MoveToPath}" 

mkdir -p -m 700 -Z ${MoveToPath}
mv ${InSrcPath} ${MoveToPath}











exit ${MyStatus}