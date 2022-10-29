data "http" "ipv4" {
  url = "https://ifconfig.co"
}

# zones
data "cloudflare_zone" "zone_private" {
  name = var.domain_private
}

data "cloudflare_zone" "zone_public" {
  name = var.domain_public
}

# vpn, will be updated frequently using a K8s CronJob
resource "cloudflare_record" "vpn" {
  zone_id = data.cloudflare_zone.zone_private.id
  type    = "A"
  name    = "vpn"
  value   = trimspace(data.http.ipv4.response_body)
}

# dmarc
resource "cloudflare_record" "dmarc" {
  zone_id = data.cloudflare_zone.zone_private.id
  type = "TXT"
  name = "_dmarc"
  value = "v=DMARC1; p=quarantine; rua=mailto:info@pascaliske.dev"
}

# dkim
resource "cloudflare_record" "dkim" {
  zone_id = data.cloudflare_zone.zone_private.id
  type = "TXT"
  name = "*._domainkey"
  value = "v=DKIM1; p="
}

# spf
resource "cloudflare_record" "spf" {
  zone_id = data.cloudflare_zone.zone_private.id
  type = "TXT"
  name = var.domain_private
  value = "v=spf1 ~all"
}

# google
resource "cloudflare_record" "google" {
  zone_id = data.cloudflare_zone.zone_private.id
  type = "TXT"
  name = var.domain_private
  value = "google-site-verification=${var.google_verification_token}"
}

# public
resource "cloudflare_record" "public" {
  zone_id = data.cloudflare_zone.zone_public.id
  type = "A"
  name = "*"
  value = var.public_ip_jakku
}

# docs
resource "cloudflare_record" "docs" {
  zone_id = data.cloudflare_zone.zone_public.id
  type = "CNAME"
  name = "k8s"
  value = "pascaliske.github.io"
}

# charts
resource "cloudflare_record" "charts" {
  zone_id = data.cloudflare_zone.zone_public.id
  type = "CNAME"
  name = "charts"
  value = "pascaliske.github.io"
}
