module "user_with_role" {
  source   = "../user_with_role"
  name     = var.name
  password_hash = var.password_hash
  index_permissions = {
    write = {
      index_patterns = toset(local.index_patterns)
      allowed_actions = toset([
        "indices:data/write/index",
        "indices:admin/create",
        "indices:data/write/bulk*",
        "indices:admin/mapping/put"
      ])
      cluster_permissions = ["cluster:monitor/main"]
    }
  }
  attributes = var.attributes
}