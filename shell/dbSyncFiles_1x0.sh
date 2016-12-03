#!/bin/bash

ProgramName="#!/bin/bash"

ProgramName="dbSyncFiles_1x0.sh"
# Richard David Conover
#  11/30/2016


# Environment has the 
TrailsDbRoot=${TRLS_DBF_ROOT}
TrailsGpsSrcFiles=${TRLS_FTP_ROOT}

if [ ${TRLS_NOISY} = 12 ]
then
echo "DbRoot  =${TrailsDbRoot}"
echo "FtpRoot =${TrailsGpsSrcFiles}"
ls -al ${TrailsDbRoot}
ls -al ${TrailsGpsSrcFiles}
fi



# Find  the specifid GPS Files To Add  "
# Richard David Conover
#  11/30/2016



# Move the specifid GPS File 
NameFilter=${1-"*.txt"}
RootPath=${2-"/home/richard/trails/db/"}
OutPath=${3-"/home/richard/trails/tmp"}
Ret=9



MyInputTxtFiles=`ls ${TrailsGpsSrcFiles}/*.txt`
MyInputZipFiles=`ls ${TrailsGpsSrcFiles}/*.zip`
MyInputFiles=`echo "${MyInputTxtFiles} ${MyInputZipFiles}"`


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
