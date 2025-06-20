resource "random_id" "random" {
  byte_length = 2
  count       = 2
}

resource "github_repository" "terraform-repo" {
  count       = 2
  name        = "terraform-repo-${random_id.random[count.index].dec}"
  description = "Code for Terraform"
  visibility  = "public"
  auto_init   = true
}

resource "github_repository_file" "readme" {
  count               = 2
  repository          = github_repository.terraform-repo[count.index].name
  branch              = "main"
  file                = "Readme.md"
  content             = "# This repository is for Infra Devs"
  overwrite_on_create = true
}

resource "github_repository_file" "index" {
  count               = 2
  repository          = github_repository.terraform-repo[count.index].name
  branch              = "main"
  file                = "index.html"
  content             = "Hello Terraform"
  overwrite_on_create = "true"
}

output "clone-urls" {
  value       = { for i in github_repository.terraform-repo[*] : i.name => i.http_clone_url }
  description = "Repository URLs/Names"
  sensitive   = false
}