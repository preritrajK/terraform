terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  token = var.github_token
}

resource "github_repository" "this" {
  name               = "${var.project}-${var.env}"
  description        = "${var.project} ${var.env} repository"
  auto_init          = var.auto_init
  gitignore_template = var.gitignore
}
