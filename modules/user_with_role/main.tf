module "role" {
  source              = "../role"
  name                = var.name
  index_permissions   = var.index_permissions
  cluster_permissions = var.cluster_permissions
  mapping_users       = [opensearch_user.user.username]
}

resource "opensearch_user" "user" {
  username   = var.name
  password_hash   = var.password_hash
  attributes = var.attributes
}