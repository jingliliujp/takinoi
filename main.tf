provider "google" {
    project = "takinoi"
    region = "us-central1"
    zone = "us-central1-a"
}

terraform {
    backend "gcs" {
        bucket = "8ccfa95e84586ade-bucket-tfstate"
    }
}
resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "tfstate" {
  name = "${random_id.bucket_prefix.hex}-bucket-tfstate"
  force_destroy = false
  location = "US"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }

}