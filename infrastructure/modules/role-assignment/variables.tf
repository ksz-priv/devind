variable "scope" {
  type = string
}

variable "users" {
  type = list(object({
    upn                  = string
    role_definition_name = string
  }))
  default = [{
    role_definition_name = ""
    upn                  = ""
  }]
}