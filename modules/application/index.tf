resource "opensearch_index_template" "index_template" {
  count = var.create_data_stream ? 0 : 1
  name = var.name
  body = templatefile("${path.module}/files/index_template.tftpl", {
    replicas = "${var.index_template_replicas}",
    shards = "${var.index_template_shards}",
    mappings = "${var.index_template_mappings}",
    index_patterns = jsonencode(local.index_patterns)
  })
}

resource "opensearch_composable_index_template" "comp_index_template" {
  count = var.create_data_stream ? 1 : 0
  name = var.name
  body = <<EOF
{
  "index_patterns": ${jsonencode(local.index_patterns)},
  "data_stream": {}
}
EOF
}

resource "opensearch_data_stream" "data_stream" {
  count = var.create_data_stream ? 1 : 0
  name       = local.data_stream_name
  depends_on = [opensearch_composable_index_template.comp_index_template]
}