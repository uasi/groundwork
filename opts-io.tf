resource "cloudflare_record" "opts-io_a" {
  domain  = "opts.io"
  type    = "A"
  name    = "@"
  value   = "149.28.22.95"
  proxied = true
}

resource "cloudflare_record" "opts-io_cname_hnr-rec" {
  domain  = "opts.io"
  type    = "CNAME"
  name    = "hnr-rec"
  value   = "opts.io"
  proxied = true
}

resource "cloudflare_record" "opts-io_txt" {
  domain = "opts.io"
  type   = "TXT"
  name   = "opts.io"
  value  = "keybase-site-verification=tCZRLGFWxKvAWWs6IXiCr2ShB5hq9wW12colDD40gos"
}
