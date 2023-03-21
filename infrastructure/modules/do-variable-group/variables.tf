variable "do_project_name" {
  type = string
}

variable "do_variable_group" {
  type = object({
    name         = string
    description  = string
    allow_access = bool
  })
}

variable "do_variable_group_variable" {
  type = list(object({
    name      = string
    value     = string
    is_secret = bool
  }))
}