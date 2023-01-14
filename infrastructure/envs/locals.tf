locals {
  resource_prefix = "${substr(var.owner, 0, 1)}${substr(var.environment, 0, 1)}-${var.project}"

  tags = {
    "Owner"       = var.owner,
    "Environment" = var.environment,
    "Project"     = var.project,
    "Management"  = "terraform",
  }
}
