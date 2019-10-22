#!/bin/bash
projectIdList="clgx-datalayer-sbx-12c3,clgx-iac-prd-757b,clgx-iac-sbx-8893,clgx-ctt-sbx-7a02"
Field_Separator=$IFS
 
# set comma as internal field separator for the string list
IFS=,
for projectId in $projectIdList; do
    echo $projectId
    gcloud projects describe $projectId | grep projectNumber
done
 
IFS=$Field_Separator