from libcloud.compute.types import Provider
from libcloud.compute.providers import get_driver

import sys
import csv

#USER_ID = "sax@project-id.iam.gserviceaccount.com"
#KEYFILE = "sa-key.json"
NETWORKPROJECT = str(sys.argv[1])
PROJECT = str(sys.argv[2])

cls = get_driver(Provider.GCE)
#driver = cls(USER_ID, KEYFILE, project = PROJECT)
driver = cls('', '', project = PROJECT)

with open('cl_net_gce_instances.csv', 'a') as csvFile:

    noOfNodes = len(driver.list_nodes)
    row = [NETWORKPROJECT, PROJECT, noOfNodes]
    writer = csv.writer(csvFile)
    writer.writerow(row)
    print(row)

csvFile.close()