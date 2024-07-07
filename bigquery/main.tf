resource "google_project_service" "demo_project_bigquery_service" {
  project = var.project_id
  service = "bigquery.googleapis.com"
  disable_dependent_services = true
}


resource "google_bigquery_dataset" "bronze_source1" {
  dataset_id                  = "bronze_source1"
  friendly_name               = "bronze_source1"
  description                 = "This is a test description"
  location                    = var.gcp_region
  default_table_expiration_ms = 3600000

  labels = {
    env = "default"
  }
}

resource "google_bigquery_table" "source1_table1" {
  dataset_id = google_bigquery_dataset.bronze_source1.dataset_id
  table_id   = "table1"

  time_partitioning {
    type = "DAY"
  }

  labels = {
    env = "default"
  }

  schema = <<EOF
[
  {
    "name": "order_id",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "unique order id"
  },
  {
    "name": "product_id",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "product id"
  }
]
EOF

}