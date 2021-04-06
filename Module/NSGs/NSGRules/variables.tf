variable "location" {
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
variable "rule_name" {
  type        = string
  description = "Name for NSG rules"
}
variable "rule_priority" {
  type        = string
  description = "Priority of the Rules"
}
variable "rule_direction" {
  type        = string
  description = "Direction for Rules"
}
variable "rule_access" {
  type        = string
  description = "Access for rule Allow/Deny"
}
variable "rule_protocol" {
  type        = string
  description = "Portocal for NSG Rules"
}
variable "source_port_ranges" {
  type        = string
  description = "Port range for source IP"
}
variable "source_address_prefix" {
  type        = string
  description = "Source address Prefix"
}
variable "destination_port_ranges" {
  type        = string
  description = "Port range for destination IP"
}
variable "destination_address_prefix" {
  type        = string
  description = "Destination address Prefix"
}
variable "rule_description" {
  type        = string
  description = "Description for rules"
}
