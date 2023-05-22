#This is using the default provider
resource "azurerm_resource_group" "myrgrp1" {
  name     = "myrgrp-1"
  location = "East US"

}
/*
#thsi is using secondery provider
resource "azurerm_resource_group" "myrgrp-2" {
  name     = "myrgrp-2"
  location = "West US"
  provider = azurerm.provider2-westus #Secondry provider alias is being used here
}

resource "random_string" "myrandomrc" {
  length  = 16
  special = false
  upper   = false

}

resource "azurerm_storage_account" "mycustomname" {
  name                     = "str${random_string.myrandomrc.id}"
  resource_group_name      = azurerm_resource_group.myrgrp-2.name
  location                 = azurerm_resource_group.myrgrp-2.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}*/