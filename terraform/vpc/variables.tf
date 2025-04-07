variable "environment_name" {
  description = "The name of the environment"
  type        = string
}

variable "ipv4_cidr_block" {
  description = "The IPv4 CIDR block for the VPC"
  type        = string
}

variable "subnet_count" {
  description = "The number of subnets to create per availability zone and subnet type"
  type        = number
  default     = 2
}

variable "interface_endpoint_services" {
  description = "The list of interface endpoint services to create"
  type        = set(string)
  default     = []
}
