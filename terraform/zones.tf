# internal / private
data "cloudflare_zone" "zone_internal" {
  name = local.domain_internal
}

# external / public
data "cloudflare_zone" "zone_external" {
  name = local.domain_external
}
