# Groundwork

## Installation

```bash
cat <<END >> ~/.aws/credentials
[terraform-groundwork]
aws_access_key_id = "..."
aws_secret_access_key = "..."
END

cat <<END > terraform.tfvars
cloudflare_email = "..."
cloudflare_api_key = "..."
END

terraform init
```

## Links

- [Terraform Doc - Home](https://www.terraform.io/docs/index.html)
- [Terraform Doc - AWS Provider](https://www.terraform.io/docs/providers/aws/index.html)
- [Terraform Doc - aws\_route53\_record](https://www.terraform.io/docs/providers/aws/r/route53_record.html)
- [Terraform Doc - CloudFlare Provider](https://www.terraform.io/docs/providers/cloudflare/index.html)
- [Terraform Doc - cloudflare\_record](https://www.terraform.io/docs/providers/cloudflare/r/record.html)
