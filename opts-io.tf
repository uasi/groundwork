locals {
  opts_io_zone_id = "8c81bc29b9c776e5f3170a87b1fc1407"
}

resource "cloudflare_record" "opts-io_a" {
  zone_id = local.opts_io_zone_id
  type    = "A"
  name    = "@"
  value   = "34.83.108.165"
  proxied = true
}

resource "cloudflare_record" "opts-io_cname_hnr-rec" {
  zone_id = local.opts_io_zone_id
  type    = "CNAME"
  name    = "hnr-rec"
  value   = "opts.io"
  proxied = true
}

resource "cloudflare_record" "opts-io_txt" {
  zone_id = local.opts_io_zone_id
  type   = "TXT"
  name   = "opts.io"
  value  = "keybase-site-verification=tCZRLGFWxKvAWWs6IXiCr2ShB5hq9wW12colDD40gos"
}

resource "cloudflare_zone_settings_override" "opts-io_zone_settings" {
  zone_id = local.opts_io_zone_id

  settings {
    tls_1_3                  = "on"
    always_use_https         = "on"
    automatic_https_rewrites = "on"
  }
}
