provider "azurerm" {
  version = "2.54.0"
  features {}
}
resource "azurerm_resource_group" "nsg_rg" {
  name     = var.hao-test-rg_name
  location = var.location
}

resource "azurerm_network_security_group" "hao_mgmt_nsg" {
  name                = "${var.hao_mgmt_nsg_name}"
  location            = azurerm_resource_group.nsg_rg.location
  resource_group_name = azurerm_resource_group.nsg_rg.name
}

resource "azurerm_network_security_rule" "nsg_hao_rules" {
  name                          = var.rule_name[count.index], "name", "defaultruleplaceholder"
  priority                      = var.rule_priority[count.index], "priority", 64999
  direction                     = var.rule_direction[count.index], "direction", "Inbound"
  access                        = var.rule_access[count.index], "access", "Deny"
  protocol                      = var.rule_protocol[count.index], "protocol", "udp"
  source_port_range             = var.source_port_ranges[count.index], "source_port_ranges", "8888"
  source_address_prefix         = var.source_address_prefix[count.index], "source_address_prefix", "8.8.8.8/32"
  destination_port_range        = var.destination_port_ranges[count.index], "destination_port_ranges", "8888"
  destination_address_prefix    = var.destination_address_prefix[count.index], "destination_address_prefix", "8.8.8.8/32"
  description                   = var.rule_description[count.index], "description", "defaultplaceholder"
  resource_group_name           = azurerm_resource_group.nsg_rg.name
  network_security_group_name   = azurerm_network_security_group.hao_mgmt_nsg.name
}