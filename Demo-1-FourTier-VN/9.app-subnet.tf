#create app subnet
resource "azurerm_subnet" "app_subnet" {
  name                 = "${azurerm_virtual_network.VNet.name}-${var.VNet_Name}"
  virtual_network_name = azurerm_virtual_network.VNet.name
  resource_group_name  = azurerm_resource_group.ResourceGroupVN.name
  address_prefixes     = var.AppSubnetAddressSapce
}

#Create a securty group for App subnet
resource "azurerm_network_security_group" "app_security_group" {
  name                = "${azurerm_subnet.app_subnet.name}-NSG"
  resource_group_name = azurerm_resource_group.ResourceGroupVN.name
  location            = azurerm_resource_group.ResourceGroupVN.location
}
#create a App subnet security group rules with locals map for priority anf ports
locals {
  app_rule_ports_map = {
    "100" : "80", # If the key starts with a number, you must use the colon syntax ":" instead of "="
    "110" : "443",
    "120" : "8080",
    "130" : "22"
  }
}

resource "azurerm_network_security_rule" "app_sgrule" {
  for_each                    = local.app_rule_ports_map
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
  network_security_group_name = azurerm_network_security_group.app_security_group.name

}


##Associate the security group to the App subnet
resource "azurerm_subnet_network_security_group_association" "App_subnet_NSG_assciation" {
  depends_on                = [azurerm_network_security_rule.app_sgrule]
  subnet_id                 = azurerm_subnet.app_subnet.id
  network_security_group_id = azurerm_network_security_group.app_security_group.id
}