resource "cloudflare_record" "opts-io_txt" {
  domain = "opts.io"
  type   = "TXT"
  name   = "opts.io"
  value  = "keybase-site-verification=tCZRLGFWxKvAWWs6IXiCr2ShB5hq9wW12colDD40gos"
}
