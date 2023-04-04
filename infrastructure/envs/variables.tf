#DEFAULT VALUES

variable "owner" {
  type        = string
  description = "Owner of the project"
}

variable "environment" {
  type        = string
  description = "Name of the environment"
}

variable "project" {
  type        = string
  description = "Name of the project"
}

variable "location" {
  type        = string
  description = "Location of the resources"
}

#KUBERNETES

variable "kubernetes_config" {
  type = object({
    sku_tier                          = string
    role_based_access_control_enabled = bool
    network_profile = object({
      network_plugin = string
      network_policy = string
    })

    api_server_access_profile = object({
      authorized_ip_ranges = list(string)
    })

    default_node_pool = object({
      name       = string
      node_count = number
      vm_size    = string
    })

    identity = object({
      type = string
    })
  })

}


variable "namespace_names" {
  type = list(string)
}

# variable "namespace_name_dev" {
#   type = string
# }

# variable "namespace_name_stage" {
#   type = string
# }

# variable "namespace_name_prod" {
#   type = string
# }

#LOG-AW

variable "sku" {
  type = string
}

variable "retention_in_days" {
  type = number
}

#APP CONFIGURATION

# variable "app_configuration" {
#   type = object({
#     local_auth_enabled = bool
#     #soft_delete_retention_days = number
#     purge_protection_enabled = bool
#     sku_name                 = string
#     public_network_access    = string
#   })
# }

#ROLES APP CONF.

# variable "user_roles_ac" {
#   type = list(object({
#     upn                  = string
#     role_definition_name = string
#   }))
#   default = [{
#     role_definition_name = ""
#     upn                  = ""
#   }]
#   description = "Roles to assign to specific users to app configuration"
# }

#VARIABLE GROUP INFRA - DEVOPS

# variable "do_variable_group_infra" {
#   type = object({
#     name         = string
#     description  = string
#     allow_access = bool
#   })
#   description = "Configuration of the variable group responsible for infrastructure variables"
# }
