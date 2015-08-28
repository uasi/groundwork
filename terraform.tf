variable "aws_access_key_id" {}
variable "aws_secret_access_key" {}
variable "aws_region" {
    default = "ap-northeast-1"
}

provider "aws" {
    access_key = "${var.aws_access_key_id}"
    secret_key = "${var.aws_secret_access_key}"
    region = "${var.aws_region}"
}

resource "aws_route53_zone" "exsen-org" {
    name = "exsen.org"
}

resource "aws_route53_record" "www" {
    zone_id = "${aws_route53_zone.exsen-org.zone_id}"
    name = "exsen.org"
    type = "A"
    ttl = "300"
    records = ["54.225.69.146"]
}

resource "aws_route53_record" "kill1000favs" {
    zone_id = "${aws_route53_zone.exsen-org.zone_id}"
    name = "kill1000favs"
    type = "CNAME"
    ttl = "300"
    records = ["kill1000favs.herokuapp.com"]
}

resource "aws_route53_record" "playground" {
    zone_id = "${aws_route53_zone.exsen-org.zone_id}"
    name = "playground"
    type = "CNAME"
    ttl = "300"
    records = ["playground-exsen-org.herokuapp.com"]
}

resource "aws_route53_record" "vaporbin" {
    zone_id = "${aws_route53_zone.exsen-org.zone_id}"
    name = "vaporbin"
    type = "CNAME"
    ttl = "300"
    records = ["vaporbin.herokuapp.com"]
}
