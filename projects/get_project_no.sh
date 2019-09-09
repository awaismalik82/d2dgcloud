#!/bin/bash
projectIdList="comma,separated,projectId,list"
Field_Separator=$IFS
 
# set comma as internal field separator for the string list
IFS=,
for projectId in $projectIdList; do
    echo $projectId
    gcloud projects describe $projectId | grep projectNumber
done
 
IFS=$Field_Separator