#!/bin/sh
cd ../terraform
terraform workspace select vms1
terraform destroy -auto-approve
terraform workspace select vms2
terraform destroy -auto-approve
terraform workspace select vms3
terraform destroy -auto-approve
cd ../shell
