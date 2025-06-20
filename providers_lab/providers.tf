
terraform {
  required_version = ">= 1.0.0"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.2.0" # Allows 6.2.0, 6.2.1, 6.2.2... but not 6.3.0
    }
  }
}

provider "github" {
  owner = "preritrajK"
}
