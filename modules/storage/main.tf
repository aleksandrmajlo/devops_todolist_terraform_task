resource "azurerm_storage_account" "main" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"

  # The container exposes only the installation script.
  # The script contains no passwords, keys, or tokens.
  allow_nested_items_to_be_public = true

  tags = var.tags
}

resource "azurerm_storage_container" "artifacts" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "install_script" {
  name                   = "install-app.sh"
  storage_account_name   = azurerm_storage_account.main.name
  storage_container_name = azurerm_storage_container.artifacts.name
  type                   = "Block"
  source                 = var.install_script_source
  content_type           = "text/x-shellscript"
}