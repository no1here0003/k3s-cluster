# cluster

This is my homelab Kubernetes cluster.

Upon having multiple issues (maybe mostly from me) I decided I needed a way to quickly stand up and tear down my infrastructure. My infrastructure is:

* [Proxmox Virtual Environment](https://www.proxmox.com/en/downloads) on all machines
* 3 intel NUCs. 2 are NUC11i7's and one is a NUC10i7. All have 64Gb RAM and 2TB nvme (Samsung 970 EVO Pros)
* [Terraform](https://www.terraform.io) on my client machine to consume the Hashicorp Control Language (HCL) in the vms/terraform folder
* Consul running on another NUC10i7 (192.168.1.25:8500) see the [docker-compose.yml](consul/docker-compose.yml) for an example of setting that up (remember, it requires at least 3 servers/containers)

Update the [variables](terraform/variables.tf.example) to fit my needs and rename it to just variables.tf 


Always terraform init:

```
terraform init
```


First in the terraform directory I create the three proxmox workspaces:

```
terraform workspace new vms1
terraform workspace new vms2
terraform workspace new vms3
```

I then select whichever one I'm going to be standing infrastructure up on:

```
terraform workspace select vms1
```

Then plan:

```
terraform plan
```

Now we apply it:

```
terraform apply
```

Once everything is up and calm (my images reboot after update so it's an extra minute to wait for them) I run the [master.sh](master.sh) script.

Then I ssh to my main master and execute [kubevip.sh](shell/kubevip.sh)

Now I can run [other_masters.sh](shell/other_masters.sh)

And lastly I run [workers.sh](shell/workers.sh)


I tried messing with the provisioner local-exec and remote-exec (and file as well) to no avail. I probably need some serious sleep commands to get all timing down, and I hate sleeps commands because they rely on the only one thing that always occurs, not a true state.