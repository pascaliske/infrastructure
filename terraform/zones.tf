# internal / private
data "cloudflare_zones" "zone_search_internal" {
  name = local.domain_internal
}

data "cloudflare_zone" "zone_internal" {
  zone_id = data.cloudflare_zones.zone_search_internal.result[0].id
}

# external / public
data "cloudflare_zones" "zone_search_external" {
  name = local.domain_external
}

data "cloudflare_zone" "zone_external" {
  zone_id = data.cloudflare_zones.zone_search_external.result[0].id
}
