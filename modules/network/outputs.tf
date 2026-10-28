output "virtual_network_id" {
  description = "ID of the created Virtual Network."
  value       = azurerm_virtual_network.main.id
}

output "virtual_network_name" {
  description = "Name of the created Virtual Network."
  value       = azurerm_virtual_network.main.name
}

output "subnet_id" {
  description = "ID of the subnet used by the virtual machine."
  value       = azurerm_subnet.main.id
}

output "network_security_group_id" {
  description = "ID of the Network Security Group."
  value       = azurerm_network_security_group.main.id
}

output "public_ip_id" {
  description = "ID of the Public IP resource."
  value       = azurerm_public_ip.main.id
}

output "public_ip_address" {
  description = "Public IP address assigned to the virtual machine."
  value       = azurerm_public_ip.main.ip_address
}

output "public_fqdn" {
  description = "Fully qualified DNS name assigned to the Public IP."
  value       = azurerm_public_ip.main.fqdn
}