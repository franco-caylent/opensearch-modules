resource "opensearch_role" "role" {
  role_name = var.name

  cluster_permissions = var.cluster_permissions

  dynamic "index_permissions" {
    for_each = var.index_permissions
    content {
      index_patterns  = lookup(index_permissions.value, "index_patterns", null)
      allowed_actions = lookup(index_permissions.value, "allowed_actions", null)
      # Disabled document_level_security to bypass "all map elements must have the same type"
      #document_level_security = lookup(index_permissions.value, "document_level_security", null)
      field_level_security = lookup(index_permissions.value, "field_level_security", null)
      masked_fields        = lookup(index_permissions.value, "masked_fields", null)
    }
  }
}

resource "opensearch_roles_mapping" "role_mapping" {
  role_name     = var.name
  description   = "Mapping to ${var.name}"
  backend_roles = var.mapping_backend_roles
  users         = var.mapping_users
}