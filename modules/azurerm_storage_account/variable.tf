variable "child_storage" {
  description = "A map of child storage accounts to create"
  type        = map(object({
    name     = string
    location = string
    resource_group_name = string
    account_tier = string
    account_replication_type = string
  }))
}