provider "aws" {
  version = "~> 2.0"
  region  = "ap-northeast-1"
  profile = "terraform-groundwork"
}

provider "cloudflare" {
  version    = "~> 2.0"
  email      = var.cloudflare_email
  api_key    = var.cloudflare_api_key
  account_id = "f60414dd0930fcfea6a07ebb25b1e58f"
}
