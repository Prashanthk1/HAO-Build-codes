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
  name                          = lookup(var.hao_mgmt_rules[count.index], "name", "defaultruleplaceholder")
  priority                      = lookup(var.hao_mgmt_rules[count.index], "priority", 64999)
  direction                     = lookup(var.hao_mgmt_rules[count.index], "direction", "Inbound")
  access                        = lookup(var.hao_mgmt_rules[count.index], "access", "Deny")
  protocol                      = lookup(var.hao_mgmt_rules[count.index], "protocol", "udp")
  source_port_range             = lookup(var.hao_mgmt_rules[count.index], "source_port_ranges", "8888")
  source_address_prefix         = lookup(var.hao_mgmt_rules[count.index], "source_address_prefix", "8.8.8.8/32")
  destination_port_range        = lookup(var.hao_mgmt_rules[count.index], "destination_port_ranges", "8888")
  destination_address_prefix    = lookup(var.hao_mgmt_rules[count.index], "destination_address_prefix", "8.8.8.8/32")
  description                   = lookup(var.hao_mgmt_rules[count.index], "description", "defaultplaceholder")
  resource_group_name           = azurerm_resource_group.nsg_rg.name
  network_security_group_name   = azurerm_network_security_group.hao_mgmt_nsg.name
  count                         = length(var.hao_mgmt_rules)
}