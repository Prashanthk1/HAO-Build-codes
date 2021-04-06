ariable "location" {
  type = "string"
  description = "Location for all resources"
}

variable "networkrgname" {
  type = "string"
  description = "Location for all resources"
}

variable "hao-test-rg_name" {
  type = "string"
  description = "Name of NSG RG"
}

variable "hao_mgmt_nsg_name" {
  type = "string"
  description = "Name of NSG"
}

variable "hao_mgmt_rules" {
  type = object (
    name                        = "string"
    priority                    = "string"
    direction                   = "string"
    access                      = "string"
    protocol                    = "string"
    source_port_ranges          = "string"
    source_address_prefix       = "string"
    destination_port_ranges     = "string"
    destination_address_prefix  = "string"
    description                 = "string"

  )
  description = "Open SSH to Hub management network"
}
