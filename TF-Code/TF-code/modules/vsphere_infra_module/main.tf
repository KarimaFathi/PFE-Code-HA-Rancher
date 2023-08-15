data "vsphere_datacenter" "dc" {
  name = var.vsphere_dc
} 

data "vsphere_datastore" "vsan_ds" {
  name          = var.vsphere_vsan_ds
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "Rancher_cluster" {
   name          = var.Rancher_cluster
   datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vsphere_net
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vm_template     
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_host" "esxi" {
  count         = length(var.esxi_hosts)
  name          = var.esxi_hosts[count.index]
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_compute_cluster_vm_anti_affinity_rule" "anti_affinity_rule" {
  name                = "vm-anti-affinity-rule"
  enabled             = true
  compute_cluster_id  = data.vsphere_compute_cluster.Rancher_cluster.id
  virtual_machine_ids = vsphere_virtual_machine.vms.*.id
  lifecycle {
    replace_triggered_by = [ vsphere_virtual_machine.vms ]
  }
}

resource "vsphere_virtual_machine" "vms" {
  count            = var.vm_count
  name             = "${var.vm_name}-${count.index}"
  num_cpus         = var.num_cpus   
  memory           = var.memory     
  guest_id         = var.guest_id   
  datastore_id     = data.vsphere_datastore.vsan_ds.id
  resource_pool_id = data.vsphere_compute_cluster.Rancher_cluster.resource_pool_id
  disk {
    label       = "disk0"
    size        = "20"
  }
  network_interface {
    network_id = data.vsphere_network.network.id              
  }
  
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options{  
         host_name = "${var.vm_name}-${count.index}"   
         domain = "inwi.test"
      }

      network_interface {
        ipv4_address =  var.ipv4_address[count.index]            
        ipv4_netmask =  var.ipv4_netmask             
      }
      ipv4_gateway =  var.ipv4_gateway        
    }
 }
  cdrom {
    datastore_id =  data.vsphere_datastore.vsan_ds.id              
    path         =  var.iso_path             
  }
}



