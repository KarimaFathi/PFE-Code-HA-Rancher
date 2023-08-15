output "nodes" {
  value = flatten([
    for vm in vsphere_virtual_machine.vms : [
      for clone in vm.clone : [
        for customization in clone.customize : customization.network_interface.*.ipv4_address
      ]
    ]
  ])
}

