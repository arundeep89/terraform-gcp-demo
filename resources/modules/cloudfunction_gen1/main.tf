resource "google_storage_bucket" "cloud_function_bucket" {
    name     = "cloud-function-${var.project_id}"
    location = var.region
    project  = var.project_id
}

resource "google_storage_bucket" "input_bucket" {
    name     = "input-${var.project_id}"
    location = var.region
    project  = var.project_id
}

data "archive_file" "source" {
  type        = "zip"
  source_dir  = "${path.module}/src"
  output_path = "${path.module}/tmp/function.zip"
  depends_on = [ 
    google_storage_bucket.cloud_function_bucket
   ]
}

# Add source code zip to the Cloud Function's bucket (Cloud_function_bucket) 
resource "google_storage_bucket_object" "zip" {
  source       = data.archive_file.source.output_path
  content_type = "application/zip"
  name         = "src-${data.archive_file.source.output_md5}.zip"
  bucket       = google_storage_bucket.cloud_function_bucket.name
  depends_on = [
    google_storage_bucket.cloud_function_bucket,
    data.archive_file.source
  ]
}

# Create the Cloud function triggered by a `Finalize` event on the bucket
resource "google_cloudfunctions_function" "cloud_function" {
  name                  = "cloud-function-using-terraform"
  description           = "Cloud-function will get trigger once file is uploaded in input-${var.project_id}"
  runtime               = "python39"
  project               = var.project_id
  region                = var.region
  source_archive_bucket = google_storage_bucket.cloud_function_bucket.name
  source_archive_object = google_storage_bucket_object.zip.name
  entry_point           = "fileUpload"
  event_trigger {
    event_type = "google.storage.object.finalize"
    resource   = "input-${var.project_id}"
  }
  depends_on = [
    google_storage_bucket.cloud_function_bucket,
    google_storage_bucket_object.zip
  ]
}