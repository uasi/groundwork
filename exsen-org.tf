resource "cloudflare_record" "exsen-org_cname" {
  domain  = "exsen.org"
  type    = "CNAME"
  name    = "exsen.org"
  value   = "exsen-org.herokuapp.com"
  proxied = true
}

resource "cloudflare_record" "exsen-org_cname_kill1000favs" {
  domain  = "exsen.org"
  type    = "CNAME"
  name    = "kill1000favs"
  value   = "kill1000favs.herokuapp.com"
  proxied = true
}

resource "cloudflare_record" "exsen-org_cname_vaporbin" {
  domain  = "exsen.org"
  type    = "CNAME"
  name    = "vaporbin"
  value   = "vaporbin.herokuapp.com"
  proxied = true
}

resource "cloudflare_record" "exsen-org_txt" {
  domain = "exsen.org"
  type   = "TXT"
  name   = "exsen.org"
  value  = "keybase-site-verification=KucCG3jo_NJtA3GIxf9ozHN4DY2p80mkaI0o8K0sSLw"
}
