#!/bin/sh
cd ../terraform
terraform workspace select vms2
terraform plan -out vms2.tfplan
terraform apply "vms2.tfplan"
terraform workspace select vms3
terraform plan -out vms3.tfplan
terraform apply "vms3.tfplan"
terraform workspace select vms1
terraform plan -out vms1.tfplan
terraform apply "vms1.tfplan" 
cd ../shell
