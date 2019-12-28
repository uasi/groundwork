locals {
  uasi_jp_zone_id = "08f206e0314f14cb64e289b88aa2fcb3"
}

resource "cloudflare_record" "uasi-jp_cname" {
  zone_id = local.uasi_jp_zone_id
  type    = "CNAME"
  name    = "uasi.jp"
  value   = "uasi-jp.herokuapp.com"
  proxied = true
}

resource "cloudflare_record" "uasi-jp_cname_blog" {
  zone_id = local.uasi_jp_zone_id
  type    = "CNAME"
  name    = "blog"
  value   = "domains.tumblr.com"
}

resource "cloudflare_record" "uasi-jp_cname_d" {
  zone_id = local.uasi_jp_zone_id
  type    = "CNAME"
  name    = "d"
  value   = "ghs.googlehosted.com"
}

resource "cloudflare_record" "uasi-jp_cname_m" {
  zone_id = local.uasi_jp_zone_id
  type    = "CNAME"
  name    = "m"
  value   = "ghs.googlehosted.com"
}

resource "cloudflare_record" "uasi-jp_cname_q" {
  zone_id = local.uasi_jp_zone_id
  type    = "CNAME"
  name    = "q"
  value   = "domains.tumblr.com"
}

variable "mx_records" {
  # [value, priority, value, priority, ...]
  default = [
    "aspmx.l.google.com",
    "1",
    "alt1.aspmx.l.google.com",
    "5",
    "alt2.aspmx.l.google.com",
    "5",
    "aspmx2.googlemail.com",
    "10",
    "aspmx3.googlemail.com",
    "10",
  ]
}

resource "cloudflare_record" "uasi-jp_mx" {
  count    = length(var.mx_records) / 2
  zone_id  = local.uasi_jp_zone_id
  type     = "MX"
  name     = "uasi.jp"
  value    = var.mx_records[count.index * 2]
  priority = var.mx_records[count.index * 2 + 1]
}

variable "txt_records" {
  default = [
    "adn_verification=uasi",
    "google-site-verification=RwiI4xfoql9t15C1vEP7znGBSQKzkrPyKOojmgGL714",
    "keybase-site-verification=-ioMIs6ZLP6mFdsY0e1zBjGd52asZIKzWbnPJBzSjSY",
  ]
}

resource "cloudflare_record" "uasi-jp_txt" {
  count   = length(var.txt_records)
  zone_id = local.uasi_jp_zone_id
  type    = "TXT"
  name    = "uasi.jp"
  value   = element(var.txt_records, count.index)
}
