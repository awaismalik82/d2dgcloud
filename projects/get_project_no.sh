#!/bin/bash
projectIdList="clgx-vsg-qvp-glb-reg-8b94,clgx-vsg-qvp-glb-stg-c6c9,clgx-vsg-qvp-glb-dev-2ee0,clgx-vsg-qvp-glb-sbx-ef92,clgx-jenkins-glb-prd-8ea3,clgx-jenkins-glb-dev-281d,clgx-splunkhf-glb-prd-53b2,clgx-ping-us-sbx-4c7f"
Field_Separator=$IFS
 
# set comma as internal field separator for the string list
IFS=,
for projectId in $projectIdList; do
    echo $projectId
    gcloud projects describe $projectId | grep projectNumber
done
 
IFS=$Field_Separator