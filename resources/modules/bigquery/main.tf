resource "google_project_service" "demo_project_bigquery_service" {
  project = "terraform-demo-ap"
  service = "bigquery.googleapis.com"
  disable_dependent_services = true
}

resource "time_sleep" "wait_120_seconds" {
    depends_on = [ google_project_service.demo_project_bigquery_service ]
    create_duration = "120s"
}


resource "google_bigquery_dataset" "datasets" {
  for_each = local.datasetsMap
 
  depends_on = [ time_sleep.wait_120_seconds ]

  project       = "terraform-demo-ap"
  dataset_id    = each.value["datasetId"]
  friendly_name = each.value["datasetFriendlyName"]
  description   = each.value["datasetDescription"]
  location      = each.value["datasetRegion"]
}

resource "google_bigquery_table" "tables" {
  for_each = {for idx, table in local.tables_flattened : "${table["datasetId"]}_${table["tableId"]}" => table}

  project    = "terraform-demo-ap"
  depends_on = [google_bigquery_dataset.datasets]
  dataset_id = each.value["datasetId"]
  table_id   = each.value["tableId"]
  clustering = each.value["clustering"]

  dynamic "time_partitioning" {
    for_each = each.value["partitionType"] != null ? [1] : []

    content {
      type                     = each.value["partitionType"]
      field                    = each.value["partitionField"]
      expiration_ms            = each.value["expirationMs"]
    }
  }

  schema = file("${path.module}/${each.value["tableSchemaPath"]}")
  deletion_protection = false
}