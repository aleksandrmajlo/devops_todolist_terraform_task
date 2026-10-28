variable "resource_group_name" {
  description = "Name of the Resource Group where compute resources are created."
  type        = string
}

variable "location" {
  description = "Azure region for compute resources."
  type        = string
}

variable "vm_name" {
  description = "Name of the Linux virtual machine."
  type        = string
}

variable "vm_size" {
  description = "Azure VM size."
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Administrator username used for SSH access."
  type        = string
  default     = "azureuser"
}

variable "ssh_key_name" {
  description = "Name of the Azure SSH public key resource."
  type        = string
  default     = "linuxboxsshkey"
}

variable "ssh_key_public" {
  description = "Public SSH key installed on the virtual machine."
  type        = string
  sensitive   = true

  validation {
    condition     = can(regex("^ssh-", trimspace(var.ssh_key_public)))
    error_message = "ssh_key_public must contain a valid OpenSSH public key."
  }
}

variable "subnet_id" {
  description = "ID of the subnet where the VM network interface is created."
  type        = string
}

variable "public_ip_id" {
  description = "ID of the Public IP attached to the VM network interface."
  type        = string
}

variable "install_script_url" {
  description = "URL from which the Custom Script Extension downloads install-app.sh."
  type        = string
}

variable "tags" {
  description = "Tags assigned to compute resources."
  type        = map(string)
  default     = {}
}