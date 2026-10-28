resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

module "network" {
  source = "./modules/network"

  resource_group_name         = azurerm_resource_group.main.name
  location                    = azurerm_resource_group.main.location
  virtual_network_name        = var.virtual_network_name
  vnet_address_prefix         = var.vnet_address_prefix
  subnet_name                 = var.subnet_name
  subnet_address_prefix       = var.subnet_address_prefix
  network_security_group_name = var.network_security_group_name
  public_ip_address_name      = var.public_ip_address_name
  dns_label_prefix            = var.dns_label_prefix
  tags                        = var.tags
}

module "storage" {
  source = "./modules/storage"

  resource_group_name   = azurerm_resource_group.main.name
  location              = azurerm_resource_group.main.location
  storage_account_name  = var.storage_account_name
  container_name        = var.storage_container_name
  install_script_source = "${path.root}/install-app.sh"
  tags                  = var.tags
}

module "compute" {
  source = "./modules/compute"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  vm_name        = var.vm_name
  vm_size        = var.vm_size
  admin_username = var.admin_username
  ssh_key_name   = "linuxboxsshkey"
  ssh_key_public = var.ssh_key_public

  subnet_id    = module.network.subnet_id
  public_ip_id = module.network.public_ip_id

  install_script_url = module.storage.install_script_url

  tags = var.tags
}