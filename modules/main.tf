data "azuread_client_config" "current" {}

locals {
  appName              = "${var.app_name_prefix}-app"
  appUrl               = "api://${var.app_name_prefix}"
  appinsightsname      = "${var.app_name_prefix}-appinsights"
  cognitiveaccountname = "${var.app_name_prefix}-cognitive"
  keyvaultname         = "${var.app_name_prefix}-keyvault"
}


# Resource Group
resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = var.resource_group_name
}


# Log Analytics Workspace (required for Azure Container Apps)
resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = "${var.resource_group_name}-log-analytics"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

