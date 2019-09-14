#!/bin/bash
projectIdList="clgx-ins-gpl-db-glb-prd-4257"
Field_Separator=$IFS
 
# set comma as internal field separator for the string list
IFS=,
for projectId in $projectIdList; do
    echo $projectId
    gcloud projects describe $projectId | grep projectNumber
done
 
IFS=$Field_Separator