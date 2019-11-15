#!/bin/bash
declare -i inc
inc=0

gcloud projects list | cut -d ' ' -f1 | while read -r projectId ; do
    if (( $inc == 0 )) ; then
        ((inc+=1))
        continue
    fi

    echo $projectId + $inc
    python2 get_compute_info_by_project.py $projectId
    
    ((inc+=1))
    
done
