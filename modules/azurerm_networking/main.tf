resource "azurerm_virtual_network" "aks_vnet" {
    for_each = var.child_networking
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
  dns_servers         = each.value.dns_servers

  dynamic "subnet" {
    for_each = each.value.subnet
    content {
      name             = subnet.value.name
      address_prefixes = subnet.value.address_prefixes
    }
  }
}