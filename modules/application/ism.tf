resource "opensearch_ism_policy" "ism_policy" {
    policy_id = "${var.name}"
    body = var.create_data_stream ? local.data_stream_policy : local.index_policy
}
