terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.12.0"
    }
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "3.12.0"
    }
  }
  backend "http" {}
}
