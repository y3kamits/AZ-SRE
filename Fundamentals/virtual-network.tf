#Create virtual network
resource "azurerm_virtual_network" "myfstnet" {
  name                = "myfstnet-1"
  location            = azurerm_resource_group.myrgrp1.location
  resource_group_name = azurerm_resource_group.myrgrp1.name
  address_space       = ["10.0.0.0/16"]
  tags = {
    "Name" = "myfstnet-1"
  }
}

#create subnet
resource "azurerm_subnet" "mysubnet1" {
  name                 = "mysubnet-1"
  resource_group_name  = azurerm_resource_group.myrgrp1.name
  virtual_network_name = azurerm_virtual_network.myfstnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

#Create public ip address
resource "azurerm_public_ip" "mypublicip1" {
  name                = "mypublicip-1"
  location            = azurerm_resource_group.myrgrp1.location
  resource_group_name = azurerm_resource_group.myrgrp1.name
  allocation_method   = "Static"
  tags = {
    "Name" = "Dev"
  }
}

#create Network interface
resource "azurerm_network_interface" "mynic1" {
  name                = "mynic-1"
  location            = azurerm_resource_group.myrgrp1.location
  resource_group_name = azurerm_resource_group.myrgrp1.name

  ip_configuration {
    name                          = "internal-ip"
    subnet_id                     = azurerm_subnet.mysubnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mypublicip1.id
  }
}
