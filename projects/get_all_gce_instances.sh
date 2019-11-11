#!/bin/bash
netProjectId=""

declare -i instances
echo $instances

declare -i inc
inc=1

gcloud compute shared-vpc associated-projects list $netProjectId | while read -r projectLine ; do
    projectId=${projectLine:0:32}
    echo $projectId + $inc
    ((instances+=$(gcloud compute instances list --project $projectId  | wc -l)))
    echo $instances
    ((inc+=1))
done