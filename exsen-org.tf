locals {
  exsen_org_zone_id = "d8027c584ba2b385ea38e6c3a038f5ce"
}

resource "cloudflare_record" "exsen-org_cname" {
  zone_id = local.exsen_org_zone_id
  type    = "CNAME"
  name    = "exsen.org"
  value   = "exsen-org.herokuapp.com"
  proxied = true
}

resource "cloudflare_record" "exsen-org_cname_kill1000favs" {
  zone_id = local.exsen_org_zone_id
  type    = "CNAME"
  name    = "kill1000favs"
  value   = "kill1000favs.herokuapp.com"
  proxied = true
}

resource "cloudflare_record" "exsen-org_cname_vaporbin" {
  zone_id = local.exsen_org_zone_id
  type    = "CNAME"
  name    = "vaporbin"
  value   = "vaporbin.herokuapp.com"
  proxied = true
}

resource "cloudflare_record" "exsen-org_txt" {
  zone_id = local.exsen_org_zone_id
  type    = "TXT"
  name    = "exsen.org"
  value   = "keybase-site-verification=KucCG3jo_NJtA3GIxf9ozHN4DY2p80mkaI0o8K0sSLw"
}
