resource "google_storage_bucket" "gcp-bucket1" {
  name     = "nexedge-bucket-daniel81017"
  location = "US"
  storage_class = "STANDARD"
  uniform_bucket_level_access = true
}

resource "google_storage_bucket" "gcp-bucket2" {
  name     = "nexedge-bucket-daniel91509"
  location = "EU"
  storage_class = "STANDARD"
  uniform_bucket_level_access = true
}

resource "google_storage_bucket" "gcp-bucket3" {
  name     = "nexedge-bucket-daniel80320"
  location = "ASIA"
  storage_class = "STANDARD"
  uniform_bucket_level_access = true
}