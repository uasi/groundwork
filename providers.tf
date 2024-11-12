provider "aws" {
  region  = "ap-northeast-1"
  profile = "terraform-groundwork"
}

provider "cloudflare" {
  email      = var.cloudflare_email
  api_key    = var.cloudflare_api_key
}
