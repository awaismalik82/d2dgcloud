from libcloud.compute.types import Provider
from libcloud.compute.providers import get_driver

import sys
import csv

USER_ID = "tf-clgx-tsg-pso1-sbx@clgx-tsg-pso1-sbx-6188.iam.gserviceaccount.com"
KEYFILE = "/Users/awmalik/Documents/Projects/TF Learning/sa-key.json"
PROJECT = str(sys.argv[1])

cls = get_driver(Provider.GCE)
driver = cls(USER_ID, KEYFILE, project = PROJECT)
#driver = cls('', '', project = PROJECT)

with open('cl_gce_instances.csv', 'a') as csvFile:

    for node in driver.list_nodes():     
        zoneId = node.extra.get("zone")
        machineType = node.extra.get("machineType")
        row = [PROJECT, node.name, zoneId.name, machineType[machineType.rfind("/")+1:]]
        writer = csv.writer(csvFile)
        writer.writerow(row)
        print(row)

csvFile.close()