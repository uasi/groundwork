resource "aws_route53_zone" "opts-io" {
    name = "opts.io"
    lifecycle {
        prevent_destroy = true
    }
}
