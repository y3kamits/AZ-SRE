#create db subnet
resource "azurerm_subnet" "bastion_subnet" {
  name                 = "${azurerm_virtual_network.VNet.name}-${var.VNet_Name}"
  virtual_network_name = azurerm_virtual_network.VNet.name
  resource_group_name  = azurerm_resource_group.ResourceGroupVN.name
  address_prefixes     = var.BastianSubnetAddressSapce
}

#Create a securty group for bastion subnet
resource "azurerm_network_security_group" "bastion_security_group" {
  name                = "${azurerm_subnet.bastion_subnet.name}-NSG"
  resource_group_name = azurerm_resource_group.ResourceGroupVN.name
  location            = azurerm_resource_group.ResourceGroupVN.location
}
#create a bastion subnet security group rules with locals map for priority anf ports
locals {
  bastion_rule_ports_map = {
    "100" : "3306", # If the key starts with a number, you must use the colon syntax ":" instead of "="
    "110" : "1433",
    "120" : "5432"
  }
}

resource "azurerm_network_security_rule" "bastion_sgrule" {
  for_each                    = local.bastion_rule_ports_map
  name                        = "Rule_Port_${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.ResourceGroupVN.name
  network_security_group_name = azurerm_network_security_group.bastion_security_group.name

}


##Associate the security group to the bastion subnet
resource "azurerm_subnet_network_security_group_association" "bastion_subnet_NSG_assciation" {
  depends_on                = [azurerm_network_security_rule.bastion_sgrule]
  subnet_id                 = azurerm_subnet.db_subnet.id
  network_security_group_id = azurerm_network_security_group.db_security_group.id
}