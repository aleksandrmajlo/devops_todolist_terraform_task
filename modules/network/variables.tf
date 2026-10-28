variable "resource_group_name" {
  description = "Name of the Resource Group where network resources are created."
  type        = string
}

variable "location" {
  description = "Azure region for the network resources."
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the Azure Virtual Network."
  type        = string
}

variable "vnet_address_prefix" {
  description = "Address space assigned to the Virtual Network."
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet."
  type        = string
}

variable "subnet_address_prefix" {
  description = "Address prefix assigned to the subnet."
  type        = string
}

variable "network_security_group_name" {
  description = "Name of the Network Security Group."
  type        = string
}

variable "public_ip_address_name" {
  description = "Name of the Public IP resource."
  type        = string
}

variable "dns_label_prefix" {
  description = "Prefix used to generate a globally unique DNS label."
  type        = string
  default     = "matetask"

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.dns_label_prefix))
    error_message = "The DNS label prefix may contain only lowercase letters, numbers, and hyphens."
  }
}

variable "tags" {
  description = "Tags assigned to network resources."
  type        = map(string)
  default     = {}
}