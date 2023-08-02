terraform {
  required_version = ">= 0.13.1"

  required_providers {
    shoreline = {
      source  = "shorelinesoftware/shoreline"
      version = ">= 1.11.0"
    }
  }
}

provider "shoreline" {
  retries = 2
  debug = true
}

module "too_many_processes_running_on_the_host" {
  source    = "./modules/too_many_processes_running_on_the_host"

  providers = {
    shoreline = shoreline
  }
}