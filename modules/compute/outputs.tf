output "virtual_machine_id" {
  description = "ID of the Linux virtual machine."
  value       = azurerm_linux_virtual_machine.main.id
}

output "virtual_machine_name" {
  description = "Name of the Linux virtual machine."
  value       = azurerm_linux_virtual_machine.main.name
}

output "network_interface_id" {
  description = "ID of the VM network interface."
  value       = azurerm_network_interface.main.id
}

output "private_ip_address" {
  description = "Private IP address assigned to the VM."
  value       = azurerm_network_interface.main.private_ip_address
}

output "vm_extension_id" {
  description = "ID of the Custom Script VM extension."
  value       = azurerm_virtual_machine_extension.install_todo_app.id
}