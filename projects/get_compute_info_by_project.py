from libcloud.compute.types import Provider
from libcloud.compute.providers import get_driver
from datetime import datetime

import sys
import csv

#USER_ID = "sax@project-id.iam.gserviceaccount.com"
#KEYFILE = "sa-key.json"
PROJECT = str(sys.argv[1])

cls = get_driver(Provider.GCE)
#driver = cls(USER_ID, KEYFILE, project = PROJECT)
driver = cls('', '', project = PROJECT)

with open('cl_gce_instances.csv', 'a') as csvFile:

    for node in driver.list_nodes():     
        #Get the machine zone ID
        zoneId = node.extra.get("zone")
        #Get the machine type
        machineType = node.extra.get("machineType")
        #Check if there is a Local SSD attached
        localSSD = "false"

        for disk in node.extra.get("disks"):
            if disk.get("type") == "SCRATCH":
                localSSD = "true"
        
        #Get the creation date for the machine                
        creationTime = node.extra.get("creationTimestamp")
        creationDate = creationTime.split("T")[0]

        #Write the machine info to the CSV file
        row = [PROJECT, node.name, zoneId.name, machineType[machineType.rfind("/")+1:], node.state, localSSD, node.image, creationDate]
        writer = csv.writer(csvFile)
        writer.writerow(row)
        print(row)

csvFile.close()
