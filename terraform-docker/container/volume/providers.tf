# --- container/volume/providers.tf ---

terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}