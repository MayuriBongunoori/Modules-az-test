output "workspace" {
  value = terraform.workspace
}

output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "virtual_network_name" {
  value = module.network.vnet_name
}

output "subnet_name" {
  value = module.network.subnet_name
}

output "virtual_machine_name" {
  value = module.virtual_machine.vm_name
}

output "vm_pip" {
  value = module.virtual_machine.private_ips

}