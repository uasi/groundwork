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
    records = ["188.166.208.27"]
}

resource "aws_route53_record" "opts-io_awild" {
    zone_id = "${aws_route53_zone.opts-io.zone_id}"
    name = "*"
    type = "A"
    ttl = "300"
    records = ["188.166.208.27"]
}
