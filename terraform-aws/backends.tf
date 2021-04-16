# --- root/backends.tf ---

terraform {
  backend "remote" {
    organization = "algorithmica"

    workspaces {
      name = "algorithmica-dev"
    }
  }
}