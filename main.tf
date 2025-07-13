terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = "daniel-project-462315"
  credentials = file("daniel-project-462315-4ab57b348593.json")
}