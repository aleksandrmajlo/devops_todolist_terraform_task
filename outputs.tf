output "resource_group_name" {
  description = "Name of the workload Resource Group."
  value       = azurerm_resource_group.main.name
}

output "virtual_machine_id" {
  description = "ID of the deployed Linux virtual machine."
  value       = module.compute.virtual_machine_id
}

output "public_ip_address" {
  description = "Public IP address of the Todo application VM."
  value       = module.network.public_ip_address
}

output "public_fqdn" {
  description = "Public DNS name of the Todo application VM."
  value       = module.network.public_fqdn
}

output "application_url" {
  description = "URL used to open the Todo application."
  value       = "http://${module.network.public_fqdn}:8080"
}

output "ssh_command" {
  description = "Command used to connect to the VM over SSH."
  value       = "ssh ${var.admin_username}@${module.network.public_fqdn}"
}

output "artifact_storage_account_name" {
  description = "Name of the Storage Account containing install-app.sh."
  value       = module.storage.storage_account_name
}

output "install_script_url" {
  description = "URL used by the VM Extension to download install-app.sh."
  value       = module.storage.install_script_url
}