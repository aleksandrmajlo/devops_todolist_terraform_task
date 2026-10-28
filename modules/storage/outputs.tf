output "storage_account_id" {
  description = "ID of the Storage Account."
  value       = azurerm_storage_account.main.id
}

output "storage_account_name" {
  description = "Name of the Storage Account."
  value       = azurerm_storage_account.main.name
}

output "container_name" {
  description = "Name of the deployment artifacts container."
  value       = azurerm_storage_container.artifacts.name
}

output "install_script_url" {
  description = "Public URL used by the VM extension to download install-app.sh."
  value = format(
    "%s%s/%s",
    azurerm_storage_account.main.primary_blob_endpoint,
    azurerm_storage_container.artifacts.name,
    azurerm_storage_blob.install_script.name
  )
}