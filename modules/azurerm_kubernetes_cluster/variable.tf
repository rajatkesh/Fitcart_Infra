variable "child_aks_cluster" {
    description = "A map of child AKS clusters to create"
    type        = map(object({
        name                = string
        location            = string
        resource_group_name = string
        dns_prefix          = string
    }))
}