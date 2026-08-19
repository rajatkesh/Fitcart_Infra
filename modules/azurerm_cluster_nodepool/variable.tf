variable "child_aks_nodepool" {
    description = "A map of child AKS nodepools to create"
    type        = map(object({
        name                  = string
        vm_size               = string
        node_count            = number
    }))
}