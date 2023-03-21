locals {
  resource_prefix = "${substr(var.owner, 0, 3)}-${substr(var.environment, 0, 1)}-${var.project}"

  tags = {
    "Owner"       = var.owner,
    "Environment" = var.environment,
    "Project"     = var.project,
    "Management"  = "terraform",
  }
}

do_variable_group_variable_infra = [
  {
    name      = "AppConfigurationID"
    value     = module.app_configuration.app_configuration_principal_id
    is_secret = false
  }
]
