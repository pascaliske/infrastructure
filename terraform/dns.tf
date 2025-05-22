# vpn, will be updated frequently using a K8s CronJob
resource "cloudflare_dns_record" "vpn" {
  zone_id = data.cloudflare_zone.zone_internal.zone_id
  type    = "A"
  name    = "vpn.${local.domain_internal}"
  content = ""
  proxied = false
  ttl     = 1

  lifecycle {
    ignore_changes = [content]
  }
}

# dmarc
resource "cloudflare_dns_record" "dmarc" {
  zone_id = data.cloudflare_zone.zone_internal.zone_id
  type    = "TXT"
  name    = "_dmarc.${local.domain_internal}"
  content = "v=DMARC1; p=quarantine; rua=mailto:info@${local.domain_external}"
  ttl     = 1
}

# dkim
resource "cloudflare_dns_record" "dkim" {
  zone_id = data.cloudflare_zone.zone_internal.zone_id
  type    = "TXT"
  name    = "*._domainkey.${local.domain_internal}"
  content = "v=DKIM1; p="
  ttl     = 1
}

# spf
resource "cloudflare_dns_record" "spf" {
  zone_id = data.cloudflare_zone.zone_internal.zone_id
  type    = "TXT"
  name    = local.domain_internal
  content = "v=spf1 ~all"
  ttl     = 1
}

# google
resource "cloudflare_dns_record" "google" {
  zone_id = data.cloudflare_zone.zone_internal.zone_id
  type    = "TXT"
  name    = local.domain_internal
  content = "google-site-verification=${var.GOOGLE_VERIFICATION_TOKEN}"
  ttl     = 1
}

# wildcard
resource "cloudflare_dns_record" "wildcard" {
  zone_id = data.cloudflare_zone.zone_external.zone_id
  type    = "A"
  name    = "*.${local.domain_external}"
  content = local.public_ip_jakku
  ttl     = 1
}

# docs
resource "cloudflare_dns_record" "docs" {
  zone_id = data.cloudflare_zone.zone_external.zone_id
  type    = "CNAME"
  name    = "k8s.${local.domain_external}"
  content = local.domain_github
  ttl     = 1
}

# charts
resource "cloudflare_dns_record" "charts" {
  zone_id = data.cloudflare_zone.zone_external.zone_id
  type    = "CNAME"
  name    = "charts.${local.domain_external}"
  content = local.domain_github
  ttl     = 1
}
