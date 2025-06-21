locals {
  repos = {
    "infra-dev" = {
      description        = "Infrastructure Dev Repository"
      auto_init          = true
      visibility         = "private"
      gitignore_template = "Terraform"
      branch_name        = "staging"
    },
    "infra-prod" = {
      description        = "Infrastructure Prod Repository"
      auto_init          = true
      visibility         = "public"
      gitignore_template = "Terraform"
      branch_name        = "staging"
    }
  }
}
