locals {
  global_vars     = yamldecode(file(find_in_parent_folders("global.yaml")))
  region_vars     = yamldecode(file(find_in_parent_folders("region.yaml")))
  env_vars        = yamldecode(file(find_in_parent_folders("env.yaml")))
  config_vars     = yamldecode(file("${path_relative_to_include()}/config.yaml"))    
  global_config   = merge(local.global_vars.global_config, local.region_vars.global_config, local.env_vars.global_config, local.config_vars.global_config)
  module_version  = local.env_vars.module_version
  source_url      = "${local.global_vars.source_base_url}//log_analytics"
}
 
dependency "rg" {
  config_path = "${get_terragrunt_dir()}//../rg-logging"

  mock_outputs = {
    rg_name = "MOCK-app-logging-rg"
  }
  mock_outputs_allowed_terraform_commands = ["validate"]
}

terraform {
  after_hook "tflint logaws" {
    commands = ["validate", "plan"]
    execute  = ["tflint"]
  }
}

inputs = {
  resource_group_name = dependency.rg.outputs.rg_name
  cloud_region        = local.region_vars.cloud_region
  global_config       = local.global_config
}