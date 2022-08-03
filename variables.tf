variable "name" {
  default = null
  description = "(Optional) Resource name."
}

variable "platform_id" {
  default = null
  description = "(Optional) The type of virtual machine to create. The default is 'standard-v1'."
}

variable "zone" {
  default = null
  description = "(Optional) The availability zone where the virtual machine will be created. If it is not provided, the default provider folder is used."
}

variable "boot_disk" {
  default = {}
  description = "(Required) The boot disk for the instance."
}

variable "vpc_subnet_name" {
  description = "(Required) VPC subnet to place the instance."
}

variable "resources" {
  default = {}
  description = "(Required) Compute resources that are allocated for the instance."
}

variable "ipv4_private_address" {
  default = null
  description = "(Optional) The private IP address to assign to the instance. If empty, the address will be automatically assigned from the specified subnet."
}

variable "ipv6_private_address" {
  default = null
  description = "(Optional) The private IPv6 address to assign to the instance. If empty, the address will be automatically assigned from the specified subnet."
}

variable "nat_public_ip_address" {
  default = null
  description = "(Optional) Provide a public address, for instance, to access the internet over NAT."
}

variable "allocate_ipv4" {
  default = true
  description = "(Optional) Allocate an IPv4 address for the interface. The default value is true."
}

variable "allocate_ipv6" {
  default = false
  description = "(Optional) If true, allocate an IPv6 address for the interface. The address will be automatically assigned from the specified subnet."
}

variable "allocate_nat" {
  default = false
  description = "(Optional) Provide a public address, for instance, to access the internet over NAT."
}

variable "default_security_group_ingress" {
  default = []
  description = "(Optional) - A list of ingress rules to create with default security group."
}

variable "default_security_group_egress" {
  default = []
  description = "(Optional) - A list of egress rules to create with default security group."
}

variable "create_default_security_group" {
  default = false
  description = "(Optional) - Create default security group."
}

variable "vpc_security_groups" {
  default = []
  description = "(Optional) - Assign security groups to instance."
}

variable "dns_record" {
  default = {}
  description = "(Optional) List of configurations for creating ipv4 DNS records. The structure is documented below."
}

variable "ipv6_dns_record" {
  default = {}
  description = "(Optional) List of configurations for creating ipv6 DNS records. The structure is documented below."
}

variable "nat_dns_record" {
  default = {}
  description = "(Optional) List of configurations for creating ipv4 NAT DNS records. The structure is documented below."
}

variable "username" {
  default = ""
  description = "(Optional) Provide username for creation on instance with cloud-init."
}

variable "password" {
  default = ""
  description = "(Optional) Provide password for creation on instance with cloud-init for user."
}

variable "user_groups" {
  default = "sudo"
  description = "(Optional) Provide groups to assign to user on compute instance."
}

variable "ssh_key" {
  default = ""
  description = "(Optional) Provide public ssh_key to assign to user on compute instance."
}

variable "user_data" {
  default = ""
  description = "(Optional) Custom user-data for compute instance."
}

variable "allow_stopping_for_update" {
  default = false
  description = "(Optional) Custom user-data for compute instance."
}
