terraform {
  required_providers {
    azuredevops = {
      source = "microsoft/azuredevops"
    }
  }
}

data "azuredevops_project" "do_project" {
  name = var.do_project_name
}

resource "azuredevops_variable_group" "do_variable_group" {
  project_id   = data.azuredevops_project.do_project.id
  name         = var.do_variable_group.name
  description  = var.do_variable_group.description
  allow_access = var.do_variable_group.allow_access

  dynamic "variable" {
    for_each = var.do_variable_group_variable
    content {
      name         = variable.value.name
      value        = variable.value.is_secret ? null : variable.value.value
      secret_value = variable.value.is_secret ? variable.value.value : null
      is_secret    = variable.value.is_secret
    }
  }
}