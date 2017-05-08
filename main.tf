terraform {
  backend "s3" {
    bucket     = "exsen-terraform-states"
    key        = "groundwork"
    region     = "ap-northeast-1"
  }
}
