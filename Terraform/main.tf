module "gke_cluster" {
  source         = "github.com/otrokov/tf-google-gke-cluster"
  GOOGLE_REGION  = var.GOOGLE_REGION
  GOOGLE_PROJECT = var.GOOGLE_PROJECT
  GKE_NUM_NODES  = 2
}
terraform {
  backend "gcs" {
    bucket = "kbot_bucket"
    prefix = "terraform/state"
  }
}