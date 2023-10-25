provider "opensearch" {
  url      = "https://localhost:9200"
  insecure = true
  username = "admin"
  password = "admin"
}

terraform {
  required_providers {
    opensearch = {
      source  = "opensearch-project/opensearch"
      version = ">= 2.0.0, < 3.0.0"
    }
  }
}

