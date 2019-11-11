from libcloud.compute.types import Provider
from libcloud.compute.providers import get_driver

import sys
import csv

#USER_ID = "sa@project-id.iam.gserviceaccount.com"
#KEYFILE = "key.json"
PROJECT = str(sys.argv[1])

cls = get_driver(Provider.GCE)
#driver = cls(USER_ID, KEYFILE, project = PROJECT)
driver = cls('', '', project = PROJECT)

with open('cl_gce_instances.csv', 'a') as csvFile:

    for node in driver.list_nodes():     
        zoneId = node.extra.get("zone")
        machineType = node.extra.get("machineType")
        localSSD = "false"

        for disk in node.extra.get("disks"):
            if disk.get("type") == "SCRATCH":
                localSSD = "true"

        row = [PROJECT, node.name, zoneId.name, machineType[machineType.rfind("/")+1:], node.state, localSSD]
        writer = csv.writer(csvFile)
        writer.writerow(row)
        print(row)

csvFile.close()
