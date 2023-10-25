module "user_with_role" {
  source   = "../../modules/user_with_role"
  name     = "user-with-role"
  password_hash = "$2y$12$QB1Ju3D508OnRLTRKRZeeO3Jj1JMgYynWu/dI8WsHdwvthqLwncRG"
  index_permissions = {
    write = {
      index_patterns = toset(["index1-*", "index2"])
      allowed_actions = toset([
        "indices:data/write/index",
        "indices:admin/create",
        "indices:data/write/bulk*",
        "indices:admin/mapping/put"
      ])
    }
  }
  cluster_permissions = ["cluster:monitor/main"]
  attributes = {
    "Terraform" = "true"
    "Deployment" = "opensearch-modules-example"
  }
}