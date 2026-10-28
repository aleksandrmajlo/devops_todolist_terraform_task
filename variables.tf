variable "location" {
  description = "Azure region where workload resources are created."
  type        = string
  default     = "indiasouthcentral"
}

variable "resource_group_name" {
  description = "Name of the new workload Resource Group."
  type        = string
  default     = "mate-azure-task-12-tf"
}

variable "virtual_network_name" {
  description = "Name of the Virtual Network."
  type        = string
  default     = "vnet"
}

variable "vnet_address_prefix" {
  description = "Address space assigned to the Virtual Network."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_name" {
  description = "Name of the VM subnet."
  type        = string
  default     = "default"
}

variable "subnet_address_prefix" {
  description = "Address prefix assigned to the VM subnet."
  type        = string
  default     = "10.0.0.0/24"
}

variable "network_security_group_name" {
  description = "Name of the Network Security Group."
  type        = string
  default     = "defaultnsg"
}

variable "public_ip_address_name" {
  description = "Name of the Public IP resource."
  type        = string
  default     = "linuxboxpip"
}

variable "dns_label_prefix" {
  description = "Prefix used to generate the VM public DNS name."
  type        = string
  default     = "matetask"
}

variable "vm_name" {
  description = "Name of the Linux virtual machine."
  type        = string
  default     = "matebox"
}

variable "vm_size" {
  description = "Azure VM size."
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Administrator username used for SSH."
  type        = string
  default     = "azureuser"
}

variable "ssh_key_public" {
  description = "Public SSH key installed on the VM."
  type        = string
  sensitive   = true
}

variable "storage_account_name" {
  description = "Globally unique Storage Account name for deployment artifacts."
  type        = string

  validation {
    condition = (
      length(var.storage_account_name) >= 3 &&
      length(var.storage_account_name) <= 24 &&
      can(regex("^[a-z0-9]+$", var.storage_account_name))
    )
    error_message = "The Storage Account name must contain 3-24 lowercase letters and numbers."
  }
}

variable "storage_container_name" {
  description = "Name of the deployment artifacts container."
  type        = string
  default     = "task-artifacts"
}

variable "tags" {
  description = "Common tags assigned to Azure resources."
  type        = map(string)

  default = {
    project     = "mate-terraform-todolist"
    environment = "training"
    managed_by  = "terraform"
  }
}