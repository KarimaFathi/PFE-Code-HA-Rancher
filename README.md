# Automated Deployment of a Highly Available Rancher Platform on VMware vSphere
Welcome to my final year project! &#x1F680;
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
- A Role for the installation of RKE2.f 
- A Role for installing and configuring Nginx.
- A Role for installing and configuring Bind.
- A Role for Deploying Rancher on the RKE2 cluster.

  
