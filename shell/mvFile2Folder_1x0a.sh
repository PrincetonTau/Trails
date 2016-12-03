#!/bin/bash

ProgramName="mvFile2Folder_1x0.sh"

# Location of the input GPS file
InFile=`basename $1`

# Location of the DB_ROOT where the file is to be placed
OutDBRoot=$2

#Get the current "Clock Time" of the server
DateToday=`date +%m_%d_%y`

ThisMonth=`echo ${DateToday} | cut -d_ -f1`
ThisDay=`echo ${DateToday} | cut -d_ -f2`
ThisYear=`echo ${DateToday} | cut -d_ -f3`
YearStamp=${ThisYear}
# ------------------------

ThisMonthDay="${ThisMonth}${ThisDay}"
#echo "This Month Day = ${ThisMonthDay}"


#Get the MonthDay field from the GPS file
FileMonthDay=`echo ${InFile} | cut -d. -f1|cut -d_ -f2`
echo "FileMonthDay = ${FileMonthDay}"

#Check for a 'Time Wrap' where GPS is later than the current time
if [ ${FileMonthDay} -gt ${ThisMonthDay} ]
then
  #echo "Year wrap error"
  YearStamp=$[YearStamp -1]
fi

#echo ${DateToday}
#echo ${ThisMonth}
#echo ${ThisDay}
#echo ${YearStamp}


mydate=`date +%j --date='11/06/16'`

echo "The Date Code === $mydate"
CurrentYear=`date +%y`

echo "Current Year = ${CurrentYear}"
# 


Delim='_'

MyStatus=9

InFile=`basename $1`

OutDBRoot=$2

# echo ${InFile} ${OutDBRoot}


#Val=`echo ${InFile} | cut -d. -f1 |cut -d_ -f2,4`
FileMonthDay=`echo ${InFile} | cut -d. -f1|cut -d_ -f2`
#FileMonthDay="0930"

MyFileDate1=`date +%j --date=${YearStamp}${FileMonthDay}`
echo "Directory = ${YearStamp}${MyFileDate1}"







exit ${MyStatus}



