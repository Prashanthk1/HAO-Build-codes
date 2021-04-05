variable "location" {
  type        = string
  description = "Location for all resources"
}

variable "networkrgname" {
  type        = string
  description = "Location for all resources"
}

variable "hao-test-rg_name" {
  type        = string
  description = "Name of NSG RG"
}
variable "hao_mgmt_nsg_name" {
  type        = string
  description = "Name of NSG"
}
variable "hao_mgmt_rules" {
  type        = string
  description = "Open SSH to Hub management network"
}
