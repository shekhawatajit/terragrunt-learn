# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.11.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-aad"
    storage_account_name = "sankhygeneric"
    container_name       = "sanai"
    key                  = "sktip.tfstate"
    subscription_id      = "6e33624e-e52c-4cbe-bd14-5714a1116de8"
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
  subscription_id = "6e33624e-e52c-4cbe-bd14-5714a1116de8"
}