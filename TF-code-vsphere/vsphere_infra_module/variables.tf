variable "vsphere_server" {}
variable "vsphere_user" {}
variable "vsphere_password" {}
variable "vsphere_dc" {}
variable "vsphere_vsan_ds" {}
variable "Rancher_cluster" {}
variable "vsphere_net" {}

variable "esxi_hosts" {
  type        = list(string)
  description = "The names of the ESXi hosts to use for the VMs."
}

variable "vm_count" {
  description = "Number of VMs to spin up for RKE"
  default = 3
}

variable "vm_name" {
  type        = string
  default    = "Rancher-HA"
  
}
variable "num_cpus" {
  type = number
  default = 1
}

variable "memory" {
  type = number
  default = 4096
}

variable "guest_id" {
  type = string
  default = "centos7_64Guest"  
}

variable "iso_path" {
  type = string
  default = "ISO's/CentOS-7-x86_64-DVD-2009.iso"                   
}

variable "vm_template" {
  type = string
}

variable "ipv4_address" {
   type = list(string)
}

variable "ipv4_netmask" {
  type = number
}

variable "ipv4_gateway" {
  type = string
}


