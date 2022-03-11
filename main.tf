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



provider "google" {
  project = "blue-bean-games"
  region  = "eu-west2"
}

provider "gitlab" {
  token = var.gitlab_token
}

resource "google_dns_managed_zone" "bluebean-games" {
  name        = "bluebean-games"
  dns_name    = "bluebean.games."
  description = "DNS zone for domain: bluebean.games"

  dnssec_config {
    kind          = "dns#managedZoneDnsSecConfig"
    non_existence = "nsec3"
    state         = "on"

    default_key_specs {
      algorithm  = "rsasha256"
      key_length = 2048
      key_type   = "keySigning"
      kind       = "dns#dnsKeySpec"
    }

    default_key_specs {
      algorithm  = "rsasha256"
      key_length = 1024
      key_type   = "zoneSigning"
      kind       = "dns#dnsKeySpec"
    }
  }
}

resource "google_dns_record_set" "bluebean-games-root-a" {
  managed_zone = google_dns_managed_zone.bluebean-games.name
  name         = google_dns_managed_zone.bluebean-games.dns_name
  type         = "A"
  ttl          = "300"

  rrdatas = [
    "185.199.108.153",
    "185.199.109.153",
    "185.199.110.153",
    "185.199.111.153"
  ]
}

resource "google_dns_record_set" "bluebean-games-root-aaaa" {
  managed_zone = google_dns_managed_zone.bluebean-games.name
  name         = google_dns_managed_zone.bluebean-games.dns_name
  type         = "AAAA"
  ttl          = "300"

  rrdatas = [
    "2606:50c0:8000::153",
    "2606:50c0:8001::153",
    "2606:50c0:8002::153",
    "2606:50c0:8003::153"
  ]
}

resource "google_dns_record_set" "bluebean-games-root-txt" {
  managed_zone = google_dns_managed_zone.bluebean-games.name
  name         = google_dns_managed_zone.bluebean-games.dns_name
  type         = "TXT"
  ttl          = "300"

  rrdatas = [
    "google-site-verification=5B0oUWwWZXNJ4q4ZlEbTfiCnTpEj12G1dVd_29t3GBw"
  ]
}

resource "google_dns_record_set" "bluebean-games-root-mx" {
  managed_zone = google_dns_managed_zone.bluebean-games.name
  name         = google_dns_managed_zone.bluebean-games.dns_name
  type         = "MX"
  ttl          = "300"

  rrdatas = [
    "1 aspmx.l.google.com.",
    "5 alt1.aspmx.l.google.com.",
    "5 alt2.aspmx.l.google.com.",
    "10 alt3.aspmx.l.google.com.",
    "10 alt4.aspmx.l.google.com."
  ]
}

resource "google_dns_record_set" "bluebean-games-_github-challenge-blue-bean-games-txt" {
  managed_zone = google_dns_managed_zone.bluebean-games.name
  name         = "_github-challenge-blue-bean-games.${google_dns_managed_zone.bluebean-games.dns_name}"
  type         = "TXT"
  ttl          = "300"

  rrdatas = [
    "c6a6f1b2d6"
  ]
}

resource "google_dns_record_set" "bluebean-games-_github-pages-challenge-blue-bean-games-txt" {
  managed_zone = google_dns_managed_zone.bluebean-games.name
  name         = "_github-pages-challenge-blue-bean-games.${google_dns_managed_zone.bluebean-games.dns_name}"
  type         = "TXT"
  ttl          = "300"

  rrdatas = [
    "e2b93755c298af3c7b5831d7403675"
  ]
}

resource "google_dns_record_set" "bluebean-games-www-cname" {
  managed_zone = google_dns_managed_zone.bluebean-games.name
  name         = "www.${google_dns_managed_zone.bluebean-games.dns_name}"
  type         = "CNAME"
  ttl          = "300"

  rrdatas = [
    "bluebean.games."
  ]
}
