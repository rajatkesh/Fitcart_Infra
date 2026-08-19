resource "azurerm_kubernetes_cluster" "aks_cluster" {
    for_each = var.child_aks_cluster
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix

 default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "standard_d2als_v7"
  }

  identity {
    type = "SystemAssigned"
  }

  node_provisioning_profile {
    mode = "Manual"
  }
}