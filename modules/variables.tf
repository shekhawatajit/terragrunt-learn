variable "resource_group_name" {
  description = "The name of the resource group"
  default     = "fastapi-container-app-rg"
}

variable "resource_group_location" {
  description = "The Azure region to deploy resources"
  default     = "East US"
}

variable "tenant_id" {
  type        = string
  description = "Tenant ID."
}

variable "subscription_id" {
  type        = string
  description = "Subscription ID."
}

variable "certificate_name" {
  type        = string
  description = "Name of the certificate."
}

variable "app_name_prefix" {
  type        = string
  description = "Prefix of the app name."
}

variable "environment_type" {
  type        = string
  description = "Environment."
}