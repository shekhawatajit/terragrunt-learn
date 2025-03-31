remote_state {
  backend = "azurerm"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    resource_group_name  = "rg-aad"
    storage_account_name = "sankhygeneric"
    container_name       = "sanai"
    key                  = "${path_relative_to_include()}/terraform.tfstate"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "azurerm" {
  skip_provider_registration = true
  features {}
  subscription_id = "6e33624e-e52c-4cbe-bd14-5714a1116de8"
  tenant_id       = "74e90b42-d2a4-4580-8e00-bad008a2aaed"
}
EOF
}

