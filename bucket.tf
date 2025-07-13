resource "google_storage_bucket" "gcp-bucket" {
  name     = "nexedge-bucket-daniel81017"
  location = "US"
  storage_class = "STANDARD"
  uniform_bucket_level_access = true
}