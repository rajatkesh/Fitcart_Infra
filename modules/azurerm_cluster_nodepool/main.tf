resource "azurerm_kubernetes_cluster_node_pool" "aks_nodepool" {
    for_each = var.child_aks_nodepool
  name                  = each.value.name
  kubernetes_cluster_id = data.azurerm_kubernetes_cluster.aks_cluster.id
  vm_size               = each.value.vm_size
  node_count            = each.value.node_count

}