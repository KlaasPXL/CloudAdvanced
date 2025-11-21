# main.tf

provider "azurerm" {
  features {}
}

# Een simpele resource group
resource "azurerm_resource_group" "example" {
  name     = "rg-terraform-demo"
  location = "westeurope"
}

# Een simpele storage account (optioneel)
resource "azurerm_storage_account" "example" {
  name                     = "tfstorage${random_id.unique.hex}"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Random suffix voor storage account naam (uniek maken)
resource "random_id" "unique" {
  byte_length = 4
}