resource "aws_route53_zone" "uasi-jp" {
  name = "uasi.jp"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_route53_record" "uasi-jp_a" {
  zone_id = "${aws_route53_zone.uasi-jp.zone_id}"
  name    = "uasi.jp"
  type    = "A"
  ttl     = "300"
  records = ["204.236.218.34"]
}

resource "aws_route53_record" "uasi-jp_cname_blog" {
  zone_id = "${aws_route53_zone.uasi-jp.zone_id}"
  name    = "blog"
  type    = "CNAME"
  ttl     = "300"
  records = ["domains.tumblr.com"]
}

resource "aws_route53_record" "uasi-jp_cname_d" {
  zone_id = "${aws_route53_zone.uasi-jp.zone_id}"
  name    = "d"
  type    = "CNAME"
  ttl     = "300"
  records = ["ghs.googlehosted.com"]
}

resource "aws_route53_record" "uasi-jp_cname_m" {
  zone_id = "${aws_route53_zone.uasi-jp.zone_id}"
  name    = "m"
  type    = "CNAME"
  ttl     = "300"
  records = ["ghs.googlehosted.com"]
}

resource "aws_route53_record" "uasi-jp_cname_q" {
  zone_id = "${aws_route53_zone.uasi-jp.zone_id}"
  name    = "q"
  type    = "CNAME"
  ttl     = "300"
  records = ["domains.tumblr.com"]
}

resource "aws_route53_record" "uasi-jp_mx" {
  zone_id = "${aws_route53_zone.uasi-jp.zone_id}"
  name    = "uasi.jp"
  type    = "MX"
  ttl     = "300"

  records = [
    "1 aspmx.l.google.com",
    "5 alt1.aspmx.l.google.com",
    "5 alt2.aspmx.l.google.com",
    "10 aspmx2.googlemail.com",
    "10 aspmx3.googlemail.com",
  ]
}

resource "aws_route53_record" "uasi-jp_txt" {
  zone_id = "${aws_route53_zone.uasi-jp.zone_id}"
  name    = "uasi.jp"
  type    = "TXT"
  ttl     = "300"

  records = [
    "adn_verification=uasi",
    "google-site-verification=RwiI4xfoql9t15C1vEP7znGBSQKzkrPyKOojmgGL714",
    "keybase-site-verification=-ioMIs6ZLP6mFdsY0e1zBjGd52asZIKzWbnPJBzSjSY",
  ]
}
