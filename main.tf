terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "2.46.0"
    }
  }

provider "azurerm" {
    features {
    #   subscription_id = "7707eefe-6d93-4424-a864-dcd63a4c3c6f"
    }
  
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
 
  name                     = "tfbackendsajyo"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location # implicit dependency
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}
