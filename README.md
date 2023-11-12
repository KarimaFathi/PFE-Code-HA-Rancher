# Automated Deployment of a Highly Available Rancher Platform on VMware vSphere
Welcome to my final year project! &#x1F680;.
In this project, I've automated the infrastructure provisioning using Terraform and its configuration with Ansible. This repository serves as a reference configuration for the following tasks:
- Creation of a set of VMs on vSphere using CentOS 7 based on a template with static IP addresses.
- Application of an anti-affinity rule to ensure physical separation between VMs upon creation.
- Deployment of an RKE2 Cluster.
- Installation of Nginx and configuration as a LoadBalancer.
- Installation of Bind and configuration as DNS.
- Deployment of Rancher on the RKE2 cluster.

# Principle
The approach to accomplish the tasks outlined above leverages Terraform Modules and Ansible Roles :
- A module for the infrastructure (creating VMs in vSphere).
- A Role for the installation of RKE2.
- A Role for installing and configuring Nginx.
- A Role for installing and configuring Bind.
- A Role for Deploying Rancher on the RKE2 cluster.

# Usage

## Pre-requisites

### Variables for terraform module
To enhance Terraform module flexibility, variables lack default values, necessitating explicit configuration input. Instead of responding to prompts during `terraform apply`, a more efficient solution involves using a **tfvars** file. This file, with simple key-value pairs, streamlines the configuration process, supplying Terraform with all essential input.

### Variables for Ansible roles 
Each role inside this repository has a vars directory with a main.yml file. Make sure to replace **IP addresses, domain names, etc..**, with your custom ones. Also, the inventory file should be modified accordingly.

## Infrastructure Configuration

`ansible-playbook -i inventory --private-key .ssh/id_ecdsa HA-Rancher-Playbook.yaml --ask-become-pass` 

the **--private-key** option ensures that Ansible uses the specified private key for SSH authentication when connecting to the remote hosts listed in the inventory. This key must be associated with the user account on the remote hosts and should have the corresponding public key added to the authorized_keys file. The **--ask-become-pass** option is used to prompt for the password required for privilege escalation (becoming a superuser) on the remote host using sudo.

## Useful links for documentation 

| Name | Version |
|------|---------|
| Terraform-provider-vsphere | https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/compute_cluster |
| RKE2 set up version 2.4 | https://ranchermanager.docs.rancher.com/how-to-guides/new-user-guides/kubernetes-cluster-setup/rke2-for-rancher |
| RKE2 behind a proxy | https://docs.rke2.io/advanced |
| Rancher set up version 2.7 | https://ranchermanager.docs.rancher.com/v2.7/pages-for-subheaders/install-upgrade-on-a-kubernetes-cluster |
















  
