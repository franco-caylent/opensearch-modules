locals {
  index_patterns = ["${var.name}-logs*"]
  data_stream_name = "${var.name}-logs"
  data_stream_policy = templatefile("${path.module}/files/data_stream_policy.tftpl", {index_patterns = jsonencode(local.index_patterns)})
  index_policy = templatefile("${path.module}/files/index_policy.tftpl", {index_patterns = jsonencode(local.index_patterns)})
}