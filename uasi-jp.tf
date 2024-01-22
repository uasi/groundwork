locals {
  uasi_jp_zone_id = "08f206e0314f14cb64e289b88aa2fcb3"

  uasi_jp_mx_records = [
    # [value, priority, value, priority, ...]
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

  uasi_jp_txt_records = [
    "alias.zeit.co",
    "google-site-verification=RwiI4xfoql9t15C1vEP7znGBSQKzkrPyKOojmgGL714",
    "keybase-site-verification=-ioMIs6ZLP6mFdsY0e1zBjGd52asZIKzWbnPJBzSjSY",
  ]
}

resource "cloudflare_record" "uasi-jp_a_go" {
  zone_id = local.uasi_jp_zone_id
  type    = "A"
  name    = "go"
  value   = "34.120.54.55"
}

resource "cloudflare_record" "uasi-jp_aaaa_go" {
  zone_id = local.uasi_jp_zone_id
  type    = "AAAA"
  name    = "go"
  value   = "2600:1901:0:6d85::"
}

resource "cloudflare_record" "uasi-jp_a_sakura" {
  zone_id = local.uasi_jp_zone_id
  type    = "A"
  name    = "sakura"
  value   = "207.148.92.18"
}

resource "cloudflare_record" "uasi-jp_cname" {
  zone_id = local.uasi_jp_zone_id
  type    = "CNAME"
  name    = "uasi.jp"
  value   = "alias.zeit.co"
  proxied = true
}

resource "cloudflare_record" "uasi-jp_cname_blog" {
  zone_id = local.uasi_jp_zone_id
  type    = "CNAME"
  name    = "blog"
  value   = "domains.tumblr.com"
}

resource "cloudflare_record" "uasi-jp_cname_bsky" {
  zone_id = local.uasi_jp_zone_id
  type    = "CNAME"
  name    = "bsky"
  value   = "redirect.bsky.app"
}

resource "cloudflare_record" "uasi-jp_cname_d" {
  zone_id = local.uasi_jp_zone_id
  type    = "CNAME"
  name    = "d"
  value   = "ghs.googlehosted.com"
}

resource "cloudflare_record" "uasi-jp_cname_home" {
  zone_id = local.uasi_jp_zone_id
  type    = "CNAME"
  name    = "home"
  value   = "uasi.tplinkdns.com"
}

resource "cloudflare_record" "uasi-jp_cname_home_wildcard" {
  zone_id = local.uasi_jp_zone_id
  type    = "CNAME"
  name    = "*.home"
  value   = "uasi.tplinkdns.com"
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

resource "cloudflare_record" "uasi-jp_mx" {
  count    = length(local.uasi_jp_mx_records) / 2
  zone_id  = local.uasi_jp_zone_id
  type     = "MX"
  name     = "uasi.jp"
  value    = local.uasi_jp_mx_records[count.index * 2]
  priority = local.uasi_jp_mx_records[count.index * 2 + 1]
}

resource "cloudflare_record" "uasi-jp_txt" {
  count   = length(local.uasi_jp_txt_records)
  zone_id = local.uasi_jp_zone_id
  type    = "TXT"
  name    = "uasi.jp"
  value   = element(local.uasi_jp_txt_records, count.index)
}

resource "cloudflare_record" "uasi-jp_txt_atproto" {
  zone_id = local.uasi_jp_zone_id
  type    = "TXT"
  name    = "_atproto."
  value   = "did=did:plc:pxm7yq4ra2mvnq3ygycmewsn"
}

resource "cloudflare_record" "uasi-jp_txt_go" {
  zone_id = local.uasi_jp_zone_id
  type    = "TXT"
  name    = "go.uasi.jp"
  value   = "deno-validation=53ca1a5ab55177294fa98275"
}

resource "cloudflare_page_rule" "uasi-jp_page_rule" {
  zone_id  = local.uasi_jp_zone_id
  target   = "*uasi.jp/.well-known/*"
  priority = 1

  actions {
    ssl = "off"
  }
}

resource "cloudflare_zone_settings_override" "uasi-jp_zone_settings" {
  zone_id = local.uasi_jp_zone_id

  settings {
    min_tls_version          = "1.1"
    tls_1_3                  = "on"
    always_use_https         = "off"
    automatic_https_rewrites = "on"
    ssl                      = "strict"
  }
}
