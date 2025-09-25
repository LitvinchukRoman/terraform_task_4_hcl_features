output "vm_names_upper" {
  description = "All VM names in uppercase"
  value       = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

output "vm_tags_joined" {
  value = [for vm in azurerm_virtual_machine.main : join(", ", values(vm.tags))]
}

output "vm_ids" {
  description = "List of all virtual machine IDs"
  value       = [for vm in azurerm_virtual_machine.main : vm.id]
}