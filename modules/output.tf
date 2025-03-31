output "appinsights_name" {
    description = "Name of appinsights"
    value = azurerm_log_analytics_workspace.log_analytics.name
}