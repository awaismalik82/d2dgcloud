#!/bin/bash

declare -i inc
inc=1

gcloud projects list | while read -r projectLine ; do
    projectId=${projectLine:63:20}
    echo $projectId
    ((inc+=1))
done