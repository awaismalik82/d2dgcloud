#!/bin/bash
projectIdList="clgx-network-au-nonprd-3ee6,clgx-network-au-prd-c1e4,clgx-network-au-sbx-0588,clgx-network-fnc-c278,clgx-network-mgt-ebc5,clgx-network-msb-a44d,clgx-network-nonprd-4dd3,clgx-network-prd-de02,clgx-network-rels-9837,clgx-network-sbx-77c3,clgx-network-symbility-4206"
Field_Separator=$IFS
 
# set comma as internal field separator for the string list
IFS=,
for projectId in $projectIdList; do
    #echo $projectId
    gcloud projects describe $projectId | grep projectNumber
done
 
IFS=$Field_Separator