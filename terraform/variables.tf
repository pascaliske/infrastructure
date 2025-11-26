# --- talos specific variables
variable "talos_version" {
  type        = string
  description = "Version of Talos image to deploy."
}

variable "talos_schematic" {
  type        = string
  description = "Schematic configuration to request schematic ID from Talos image factory."
}

# --- network variables

variable "network_gateway" {
  type        = string
  description = "Gateway of the network."
}

variable "network_ipv4_prefix" {
  type        = string
  description = "IPv4 prefix of the virtual machines."
}

variable "network_dns_server" {
  type        = string
  description = "DNS server of the network."
}

variable "network_dns_domain" {
  type        = string
  description = "DNS domain of the network."
}

# --- cluster variables

variable "cluster_name" {
  type        = string
  description = "Name of the Talos cluster."
}

variable "cluster_endpoint" {
  type        = string
  description = "DNS Endpoint of the cluster."
}

variable "cluster_vip" {
  type        = string
  description = "VIP of the cluster."
}

# --- control plane specific variables

variable "control_plane_prefix" {
  type        = string
  description = "Name prefix for the control planes."
}

variable "control_plane_count" {
  type        = number
  description = "Number of control plane instances."
}

variable "control_plane_cores" {
  type        = number
  description = "Number of cores for the control planes."
}

variable "control_plane_memory" {
  type        = number
  description = "Size of memory for the control planes."
}

variable "control_plane_storage" {
  type        = number
  description = "Size of storage for the control planes."
}

# --- worker specific variables

variable "worker_prefix" {
  type        = string
  description = "Name prefix for the workers."
}

variable "worker_count" {
  type        = number
  description = "Number of worker instances."
}

variable "worker_cores" {
  type        = number
  description = "Number of cores for the workers."
}

variable "worker_memory" {
  type        = number
  description = "Size of memory for the workers."
}

variable "worker_storage" {
  type        = number
  description = "Size of storage for the workers."
}

# --- dns variables

variable "GOOGLE_VERIFICATION_TOKEN" {
  type        = string
  description = "Google domain verification token to deploy via DNS record."
  sensitive   = true
}
