#!/bin/bash
projectNoList=""

Field_Separator=$IFS
# set comma as internal field separator for the string list
IFS=,
for projectNo in $projectNoList; do
    #echo $projectId
    gcloud projects list | grep $projectNo

done
 
IFS=$Field_Separator