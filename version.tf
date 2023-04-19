terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
      #version = "1.44.0"
    }
    /*random = {
      source  = "hashicorp/random"
      version = ">=3.0"
    }*/
  }
}

#This is default provider
provider "azurerm" {
  features {}
}

/*#This is secondry provider for sepcific use case like when we want to use specific options e.g. "delete disk is false for west us region" - check alias (demonstarting multiprovider concept)
provider "azurerm" {
  features {
    virtual_machine {
      delete_os_disk_on_deletion = false
    }
  }
  alias = "provider2-westus"
}*/