#Create a subnet for Web
resource "azurerm_subnet" "Web_subnet" {
  name                 = "${azurerm_virtual_network.VNet.name}-${var.WebSubnetName}"
  resource_group_name  = azurerm_resource_group.ResourceGroupVN.name
  virtual_network_name = azurerm_virtual_network.VNet.name
  address_prefixes     = var.WebSubnetAddressSapce
}

#Create a securty group for Web subnet
resource "azurerm_network_security_group" "Web_security_group" {
  name                = "${azurerm_subnet.Web_subnet.name}-NSG"
  resource_group_name = azurerm_resource_group.ResourceGroupVN.name
  location            = azurerm_resource_group.ResourceGroupVN.location
}

locals {
  web_rule_ports_map = {
    "100" : "80" #100/110/120 are the priority numbers and 80/443/22 are the ports
    "110" : "443"
    "120" : "22"
  }
}

#create a Web subnet security group rules 
resource "azurerm_network_security_rule" "web_sgrule" {
  for_each                    = local.web_rule_ports_map
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
  network_security_group_name = azurerm_network_security_group.Web_security_group.name
}

#Associate the security group to the Web subnet
resource "azurerm_subnet_network_security_group_association" "Web_subnet_NSG_association" {
  depends_on                = [azurerm_network_security_rule.web_sgrule]
  subnet_id                 = azurerm_subnet.Web_subnet.id
  network_security_group_id = azurerm_network_security_group.Web_security_group.id
}