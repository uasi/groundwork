terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "exsen"

    workspaces {
      name = "groundwork"
    }
  }
}
