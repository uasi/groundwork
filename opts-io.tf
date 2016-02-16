resource "aws_route53_zone" "opts-io" {
    name = "opts.io"
    lifecycle {
        prevent_destroy = true
    }
}

resource "aws_route53_record" "opts-io_a" {
    zone_id = "${aws_route53_zone.opts-io.zone_id}"
    name = "opts.io"
    type = "A"
    ttl = "300"
    records = ["133.130.102.137"]
}

resource "aws_route53_record" "opts-io_awild" {
    zone_id = "${aws_route53_zone.opts-io.zone_id}"
    name = "*"
    type = "A"
    ttl = "300"
    records = ["133.130.102.137"]
}
