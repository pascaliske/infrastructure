# vpn, will be updated frequently using a K8s CronJob
resource "cloudflare_record" "vpn" {
  zone_id = data.cloudflare_zone.zone_internal.id
  type    = "A"
  name    = "vpn"
  value   = ""
  proxied = false

  lifecycle {
    ignore_changes = [value]
  }
}

# dmarc
resource "cloudflare_record" "dmarc" {
  zone_id = data.cloudflare_zone.zone_internal.id
  type    = "TXT"
  name    = "_dmarc"
  value   = "v=DMARC1; p=quarantine; rua=mailto:info@${local.domain_external}"
}

# dkim
resource "cloudflare_record" "dkim" {
  zone_id = data.cloudflare_zone.zone_internal.id
  type    = "TXT"
  name    = "*._domainkey"
  value   = "v=DKIM1; p="
}

# spf
resource "cloudflare_record" "spf" {
  zone_id = data.cloudflare_zone.zone_internal.id
  type    = "TXT"
  name    = local.domain_internal
  value   = "v=spf1 ~all"
}

# google
resource "cloudflare_record" "google" {
  zone_id = data.cloudflare_zone.zone_internal.id
  type    = "TXT"
  name    = local.domain_internal
  value   = "google-site-verification=${var.GOOGLE_VERIFICATION_TOKEN}"
}

# wildcard
resource "cloudflare_record" "wildcard" {
  zone_id = data.cloudflare_zone.zone_external.id
  type    = "A"
  name    = "*"
  value   = local.public_ip_jakku
}

# docs
resource "cloudflare_record" "docs" {
  zone_id = data.cloudflare_zone.zone_external.id
  type    = "CNAME"
  name    = "k8s"
  value   = local.domain_github
}

# charts
resource "cloudflare_record" "charts" {
  zone_id = data.cloudflare_zone.zone_external.id
  type    = "CNAME"
  name    = "charts"
  value   = local.domain_github
}
