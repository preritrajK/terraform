resource "github_repository" "terraform-repo" {
  name        = "terraform-repo"
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