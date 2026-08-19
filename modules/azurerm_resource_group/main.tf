resource "azurerm_resource_group" "aks_rg" {
  for_each = var.child_rg
  name     = each.value.name
  location = each.value.location
}
