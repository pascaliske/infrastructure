data "http" "ipv4" {
  url = "https://ifconfig.co"
}

data "cloudflare_zone" "zone" {
  name = data.sops_file.secrets.data["cloudflare_domain"]
}

# vpn, will be updated frequently using a K8s CronJob
resource "cloudflare_record" "vpn" {
  zone_id = data.cloudflare_zone.zone.id
  type    = "A"
  name    = "vpn"
  value   = trimspace(data.http.ipv4.response_body)
}

# dmarc
resource "cloudflare_record" "dmarc" {
  zone_id = data.cloudflare_zone.zone.id
  type = "TXT"
  name = "_dmarc"
  value = "v=DMARC1; p=quarantine; rua=mailto:${data.sops_file.secrets.data["cloudflare_email"]}"
}

# dkim
resource "cloudflare_record" "dkim" {
  zone_id = data.cloudflare_zone.zone.id
  type = "TXT"
  name = "*._domainkey"
  value = "v=DKIM1; p="
}

# spf
resource "cloudflare_record" "spf" {
  zone_id = data.cloudflare_zone.zone.id
  type = "TXT"
  name = data.sops_file.secrets.data["cloudflare_domain"]
  value = "v=spf1 ~all"
}

# google
resource "cloudflare_record" "google" {
  zone_id = data.cloudflare_zone.zone.id
  type = "TXT"
  name = data.sops_file.secrets.data["cloudflare_domain"]
  value = "google-site-verification=${data.sops_file.secrets.data["google_verification_token"]}"
}
