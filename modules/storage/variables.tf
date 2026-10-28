variable "resource_group_name" {
  description = "Name of the Resource Group where storage resources are created."
  type        = string
}

variable "location" {
  description = "Azure region for the Storage Account."
  type        = string
}

variable "storage_account_name" {
  description = "Globally unique name of the Storage Account."
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

variable "container_name" {
  description = "Name of the container used for deployment artifacts."
  type        = string
  default     = "task-artifacts"
}

variable "install_script_source" {
  description = "Local path to the install-app.sh script."
  type        = string
}

variable "tags" {
  description = "Tags assigned to storage resources."
  type        = map(string)
  default     = {}
}