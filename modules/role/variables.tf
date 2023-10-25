variable "name" {
  type        = string
  description = "The name to use for the role"
}


variable "cluster_permissions" {
  type        = list(string)
  description = "Cluster permissions to add to the role. See https://opensearch.org/docs/latest/security/access-control/permissions/#cluster-permissions"
}

/*variable "index_permissions" {
  type = map(object({
    allowed_actions = set(string)
    document_level_security = string
    field_level_security = set(string)
    index_patterns = set(string)
    masked_fields = set(string)
  }))
  description = "Allowed actions to add to the role. See https://opensearch.org/docs/latest/security/access-control/permissions/#index-permissions"
}*/

variable "index_permissions" {
  type        = map(map(any))
  description = "Allowed actions to add to the role. See https://opensearch.org/docs/latest/security/access-control/permissions/#index-permissions"
}

variable "mapping_backend_roles" {
  type        = set(string)
  description = "Backend roles to map to the role. Can use IAM ARNs"
  default     = null
}

variable "mapping_users" {
  type        = set(string)
  description = "Internal users to map to the role. NOT IAM"
  default     = null
}

