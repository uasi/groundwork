resource "aws_route53_zone" "exsen-org" {
  name = "exsen.org"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_route53_record" "exsen-org_a" {
  zone_id = "${aws_route53_zone.exsen-org.zone_id}"
  name    = "exsen.org"
  type    = "A"
  ttl     = "300"
  records = ["54.225.69.146"]
}

resource "aws_route53_record" "exsen-org_cname_kill1000favs" {
  zone_id = "${aws_route53_zone.exsen-org.zone_id}"
  name    = "kill1000favs"
  type    = "CNAME"
  ttl     = "300"
  records = ["kill1000favs.herokuapp.com"]
}

resource "aws_route53_record" "exsen-org_cname_playground" {
  zone_id = "${aws_route53_zone.exsen-org.zone_id}"
  name    = "playground"
  type    = "CNAME"
  ttl     = "300"
  records = ["playground-exsen-org.herokuapp.com"]
}

resource "aws_route53_record" "exsen-org_cname_vaporbin" {
  zone_id = "${aws_route53_zone.exsen-org.zone_id}"
  name    = "vaporbin"
  type    = "CNAME"
  ttl     = "300"
  records = ["vaporbin.herokuapp.com"]
}

resource "aws_route53_record" "exsen-org_txt" {
  zone_id = "${aws_route53_zone.exsen-org.zone_id}"
  name    = "exsen.org"
  type    = "TXT"
  ttl     = "300"

  records = [
    "keybase-site-verification=KucCG3jo_NJtA3GIxf9ozHN4DY2p80mkaI0o8K0sSLw",
  ]
}

resource "cloudflare_record" "exsen-org_cname" {
  domain = "exsen.org"
  type   = "CNAME"
  name   = "exsen.org"
  value  = "exsen-org.herokuapp.com"
}

resource "cloudflare_record" "exsen-org_cname_kill1000favs" {
  domain = "exsen.org"
  type   = "CNAME"
  name   = "kill1000favs"
  value  = "kill1000favs.herokuapp.com"
}

resource "cloudflare_record" "exsen-org_cname_vaporbin" {
  domain = "exsen.org"
  type   = "CNAME"
  name   = "vaporbin"
  value  = "vaporbin.herokuapp.com"
}

resource "cloudflare_record" "exsen-org_txt" {
  domain = "exsen.org"
  type   = "TXT"
  name   = "exsen.org"
  value  = "keybase-site-verification=KucCG3jo_NJtA3GIxf9ozHN4DY2p80mkaI0o8K0sSLw"
}
