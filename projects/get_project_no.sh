#!/bin/bash
projectIdList="clgx-msb-glb-sbx-abc9,clgx-msb-glb-prd-ea66"
Field_Separator=$IFS
 
# set comma as internal field separator for the string list
IFS=,
for projectId in $projectIdList; do
    echo $projectId
    gcloud projects describe $projectId | grep projectNumber
done
 
IFS=$Field_Separator