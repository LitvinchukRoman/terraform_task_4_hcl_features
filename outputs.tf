output "names" {
  value = azurerm_virtual_machine.main[*].name
}

output "vm_tags_joined" {
  description = "All VM tag values joined into a single string"
  value       = join(", ", values(azurerm_virtual_machine.main[0].tags))
}

output "vm_ids" {
  description = "List of all virtual machine IDs"
  value       = [for vm in azurerm_virtual_machine.main : vm.id]
}