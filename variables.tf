variable "name" {
  type        = string
  description = "Router name"
}

variable "region" {
  type        = string
  description = "Router region"
}

variable "network" {
  type        = string
  description = "Router network"
}

variable "subnetwork" {
  type        = string
  description = "Router subnetwork link"
}

variable "min_ports_per_vm" {
  type        = string
  description = "Minimum number of ports allocated to a VM"

  default = "64"
}

variable "tcp_established_idle_timeout_sec" {
  type        = number
  description = "Timeout in seconds for TCP established connections"

  default = 1200
}

variable "tcp_transitory_idle_timeout_sec" {
  type        = number
  description = "Timeout in seconds for TCP transitory connections"

  default = 30
}

variable "udp_idle_timeout_sec" {
  type        = number
  description = "Timeout in seconds for UDP"

  default = 30
}

variable "icmp_idle_timeout_sec" {
  type        = number
  description = "Timeout in seconds for ICMP"

  default = 30
}

variable "address_count" {
  type        = number
  description = "Address count"

  default = 1
}

variable "enable_error_log" {
  type        = bool
  description = "Enable error log"

  default = true
}

variable "enable_endpoint_independent_mapping" {
  type        = bool
  description = "(Optional) Specifies if endpoint independent mapping is enabled. This is enabled by default."

  default = true
}

variable "bgp_keepalive_interval" {
  type        = number
  description = "(Optional) The interval in seconds between BGP keepalive messages that are sent to the peer. The default is 20."

  default = 20
}

variable "max_ports_per_vm" {
  type        = number
  description = "(Optional) Maximum number of ports allocated to a VM from this NAT."

  default = null
}

variable "source_subnetwork_ip_ranges_to_nat" {
  type        = string
  description = "(Optional) Source subnetwork ip to nat."

  default = "LIST_OF_SUBNETWORKS"
}
