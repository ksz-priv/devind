data "azuread_user" "user" {
  count               = var.users[0].upn == "" ? 0 : length(var.users)
  user_principal_name = var.users[count.index].upn
}

resource "azurerm_role_assignment" "role" {
  count                = var.users[0].upn == "" ? 0 : length(var.users)
  scope                = var.scope
  role_definition_name = var.users[count.index].role_definition_name
  principal_id         = data.azuread_user.user[count.index].object_id
}