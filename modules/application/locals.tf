locals {
  index_patterns = ["${var.name}-logs*"]
  data_stream_name = "${var.name}-logs"
  data_stream_policy = templatefile("${path.module}/files/data_stream_policy.tftpl", 
    {
      index_patterns = jsonencode(local.index_patterns)
      min_primary_shard_size = var.ds_rollover_min_primary_shard_size
      min_index_age = var.index_retention_policy
    })
  index_policy = templatefile("${path.module}/files/index_policy.tftpl", 
    {
      index_patterns = jsonencode(local.index_patterns)
      min_primary_shard_size = var.ds_rollover_min_primary_shard_size
      min_index_age = var.index_retention_policy
    })
}