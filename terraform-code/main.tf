resource "random_id" "random" {
  byte_length = 2
}

resource "github_repository" "terraform-repo" {
  name        = "terraform-repo-${random_id.random.dec}"
  description = "Code for Terraform"
  visibility  = "public"
  auto_init   = true
}

resource "github_repository_file" "readme" {
  repository          = github_repository.terraform-repo.name
  branch              = "main"
  file                = "Readme.md"
  content             = "# This repository is for Infra Devs"
  overwrite_on_create = true
}

resource "github_repository_file" "index" {
  repository = github_repository.terraform-repo.name
  branch = "main"
  file = "index.html"
  content = "Hello Terraform"
  overwrite_on_create = "true"
} 