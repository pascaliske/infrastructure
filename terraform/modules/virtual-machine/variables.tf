variable "id" {
  type        = number
  description = "ID of the virtual machine."

  validation {
    condition     = var.id > 0
    error_message = "The ID is required!"
  }
}

variable "order" {
  type        = number
  description = "Order of the virtual machine."

  validation {
    condition     = var.order >= 0
    error_message = "The order is required!"
  }
}

variable "name" {
  type        = string
  description = "Name of the virtual machine."

  validation {
    condition     = length(var.name) > 0
    error_message = "The name is required!"
  }
}

variable "datastore" {
  type        = string
  description = "Datastore where the virtual machine will be located."

  validation {
    condition     = length(var.datastore) > 0
    error_message = "The datastore is required!"
  }
}

variable "node" {
  type        = string
  description = "Node where the virtual machine will be located."

  validation {
    condition     = length(var.node) > 0
    error_message = "The node is required!"
  }
}

variable "cores" {
  type        = number
  description = "Number of cores for the virtual machine."
  default     = 2

  validation {
    condition     = var.cores > 0
    error_message = "Number of cores is required!"
  }
}

variable "memory" {
  type        = number
  description = "Size of memory for the virtual machine."
  default     = 2048

  validation {
    condition     = var.memory > 0
    error_message = "Memory size is required!"
  }
}

variable "storage" {
  type        = number
  description = "Size of storage for the virtual machine."
  default     = 0

  validation {
    condition     = var.storage >= 0
    error_message = "Storage size is required!"
  }
}

variable "ipv4_address" {
  type        = string
  description = "IPv4 address for the virtual machine."

  validation {
    condition     = length(var.ipv4_address) > 0
    error_message = "IPv4 address is required!"
  }
}

variable "ipv4_gateway" {
  type        = string
  description = "IPv4 gateway for the virtual machine."

  validation {
    condition     = length(var.ipv4_gateway) > 0
    error_message = "IPv4 gateway is required!"
  }
}

variable "dns_servers" {
  type        = list(string)
  description = "List of DNS servers for the virtual machine."

  validation {
    condition     = length(var.dns_servers) > 0
    error_message = "At least one DNS server is required!"
  }
}

variable "dns_domain" {
  type        = string
  description = "DNS domain for the virtual machine."

  validation {
    condition     = length(var.dns_domain) > 0
    error_message = "DNS domain is required!"
  }
}

variable "image" {
  type        = string
  description = "Image for the virtual machine."

  validation {
    condition     = length(var.image) > 0
    error_message = "Image is required!"
  }
}

variable "tags" {
  type        = list(string)
  description = "List of tags to apply to the virtual machine."
  default     = []
}
