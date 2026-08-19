terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "dev-rg28"
    storage_account_name = "devstorageacct75"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "73e9207b-6b1c-4647-aa11-ca76d043d01d"
}