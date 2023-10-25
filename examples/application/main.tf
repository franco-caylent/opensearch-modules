module "application" {
  source   = "../../modules/application"
  name     = "test-application"
  password_hash = "$2y$12$QB1Ju3D508OnRLTRKRZeeO3Jj1JMgYynWu/dI8WsHdwvthqLwncRG"
  create_data_stream = false
  index_retention_policy = 1
}