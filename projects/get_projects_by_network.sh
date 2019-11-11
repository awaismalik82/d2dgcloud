#!/bin/bash
netProjectIdList="clgx-network-au-nonprd-3ee6,clgx-network-au-prd-c1e4,clgx-network-au-sbx-0588,clgx-network-fnc-c278,clgx-network-mgt-ebc5,clgx-network-msb-a44d,clgx-network-nonprd-4dd3,clgx-network-prd-de02,clgx-network-rels-9837,clgx-network-sbx-77c3,clgx-network-symbility-4206"

Field_Separator=$IFS
 
# set comma as internal field separator for the string list
IFS=,
for netProjectId in $netProjectIdList; do    
    
    declare -i instances
    instances=0
    #echo $instances

    declare -i inc
    inc=0

    echo "--------" $netProjectId "--------"
    gcloud compute shared-vpc associated-projects list $netProjectId  | cut -d ' ' -f1 | while read -r projectId ; do
        if (( $inc == 0 )) ; then
            ((inc+=1))
            continue
        fi

        echo $projectId + $inc
        echo "calling python here with" $netProjectId $projectId 
        python2 get_compute_count_by_network_project.py $netProjectId $projectId    
        ((inc+=1))
    done
done
IFS=$Field_Separator
