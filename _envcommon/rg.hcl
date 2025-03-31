locals {
  global_vars     = yamldecode(file(find_in_parent_folders("global.yaml")))
  region_vars     = yamldecode(file(find_in_parent_folders("region.yaml")))
  env_vars        = yamldecode(file(find_in_parent_folders("env.yaml")))
  config_vars     = yamldecode(file("${path_relative_to_include()}/config.yaml"))
  global_config   = merge(local.global_vars.global_config, local.region_vars.global_config, local.env_vars.global_config, local.config_vars.global_config)
  module_version  = local.env_vars.module_version
  source_url      = "${local.global_vars.source_base_url}//rg"
}

terraform {
  after_hook "tflint rg" {
    commands = ["validate", "plan"]
    execute  = ["tflint"]
  }
}

inputs = {
  global_config = local.global_config
  cloud_region = local.region_vars.cloud_region
  custom_name = local.config_vars.name
}
