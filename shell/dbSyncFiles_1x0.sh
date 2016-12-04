#!/bin/bash

ProgramName="#!/bin/bash"

ProgramName="dbSyncFiles_1x0.sh"

# Find  the specifid GPS Files To Add 
# Richard David Conover
#  11/30/2016

# Environment has the path to the source files and database 
# All of the input files are in the path - ${TRLS_FTP_ROOT}
TrailsGpsSrcFiles=${TRLS_FTP_ROOT}

# The GPS Capture database is 
TrailsDbRoot=${TRLS_DBF_ROOT}


# Show datasets if noisy
if [ ${TRLS_NOISY} = 12 ]
then
echo "DbRoot  =${TRLS_DBF_ROOT}"
echo "FtpRoot =${TRLS_FTP_ROOT}"
ls -al ${TrailsDbRoot}
ls -al ${TrailsGpsSrcFiles}
fi



# Find  the specifid GPS Files To Add  "
# Richard David Conover
#  11/30/2016

# Move the specifid GPS File 
#NameFilter=${1-"*.txt"}
#RootPath=${2-"/home/richard/trails/db/"}
#OutPath=${3-"/home/richard/trails/tmp"}

Ret=9

# - - - - - - - - - - - - - - - - - - - - - - - -
MyInputZipFiles=`ls ${TrailsGpsSrcFiles}/*.zip`

if [ ${TRLS_SYNC_TXT} = 1 ]
then
MyInputFiles=`ls ${TrailsGpsSrcFiles}/*.txt`
fi

if [ ${TRLS_SYNC_ZIP} = 1 ]
then
MyInputFiles+=`ls ${TrailsGpsSrcFiles}/*.zip`
fi










#echo ${MyInputFiles}

for f in ${MyInputFiles}
do
  echo "Processing $f..."
  # take action on each file. $f store current file name
  # echo $f
done





#find ${RootPath} -name "${NameFilter}" -exec cp {} ${OutPath} \;
Ret=$?

exit ${Ret}
