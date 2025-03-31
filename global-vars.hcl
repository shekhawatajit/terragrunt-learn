locals {

  app_name = "samna" 
  
  tags = {
    "name"            = "${local.app_name}"
    "cost_costcenter" = "456"
  }

  resource_names = {
    tf_backend_name       = "${local.app_name}-iac-tfstate"
    rg_name_base          = "${local.app_name}-$PLACEHOLDER-rg"
    log_analytics_ws_name = "${local.app_name}-log-analytics-ws-$PLACEHOLDER" # "$PLACEHOLDER" will be replaced based upon purpose. Don't change this
  }