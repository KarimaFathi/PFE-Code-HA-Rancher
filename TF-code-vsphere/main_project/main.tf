module "vsphere_infra_rancher" {
  source = "../vsphere_infra_module"

  vsphere_server   = var.vsphere_server
  vsphere_user     = var.vsphere_user
  vsphere_password = var.vsphere_password
  vsphere_dc       = var.vsphere_dc
  vsphere_vsan_ds  = var.vsphere_vsan_ds
  Rancher_cluster  = var.Rancher_cluster
  vsphere_net      = var.vsphere_net
  esxi_hosts       = var.esxi_hosts
  vm_count         = var.vm_count
  vm_name          = var.vm_name
  num_cpus         = var.num_cpus
  memory           = var.memory
  guest_id         = var.guest_id
  iso_path         = var.iso_path
  vm_template      = var.vm_template
  ipv4_address     = var.ipv4_address
  ipv4_netmask     = var.ipv4_netmask
  ipv4_gateway     = var.ipv4_gateway
}

