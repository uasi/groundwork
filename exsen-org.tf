locals {
  exsen_org_zone_id = "d8027c584ba2b385ea38e6c3a038f5ce"

  exsen_org_txt_records = [
    "keybase-site-verification=KucCG3jo_NJtA3GIxf9ozHN4DY2p80mkaI0o8K0sSLw",
    "alias.zeit.co",
  ]
}

resource "cloudflare_record" "exsen-org_cname" {
  zone_id = local.exsen_org_zone_id
  type    = "CNAME"
  name    = "exsen.org"
  value   = "alias.zeit.co"
  proxied = true
}

resource "cloudflare_record" "exsen-org_txt" {
  count   = length(local.exsen_org_txt_records)
  zone_id = local.exsen_org_zone_id
  type    = "TXT"
  name    = "exsen.org"
  value   = element(local.exsen_org_txt_records, count.index)
}

resource "cloudflare_page_rule" "exsen-org_page_rule" {
  zone_id  = local.exsen_org_zone_id
  target   = "*exsen.org/.well-known/*"
  priority = 1

  actions {
    ssl = "off"
  }
}

resource "cloudflare_zone_settings_override" "exsen-org_zone_settings" {
  zone_id = local.exsen_org_zone_id

  settings {
    min_tls_version          = "1.1"
    tls_1_3                  = "on"
    always_use_https         = "off"
    automatic_https_rewrites = "on"
    ssl                      = "strict"
  }
}
