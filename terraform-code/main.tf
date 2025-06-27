# resource "random_id" "random" {
#   byte_length = 2
#   count       = var.repo_count
# }

resource "github_repository" "terraform-repo" {
  for_each    = var.repos
  name        = "terraform-repo-${each.key}"
  description = "${each.key} Code for Terraform"
  visibility  = var.env == "dev" ? "private" : "public"
  auto_init   = true
  provisioner "local-exec" {
    command = "gh repo view $(self.name) --web"
  }
  provisioner "local-exec" {
    command = "gh repo clone $(self.name)"
  }
  provisioner "local-exec" {
    when    = destroy
    command = "rm -rf $(self.name)"
  }
}

resource "github_repository_file" "readme" {
  for_each            = var.repos
  repository          = github_repository.terraform-repo[each.key].name
  branch              = "main"
  file                = "Readme.md"
  content             = "# This $(var.env) repository is for Infra Devs"
  overwrite_on_create = true
}

resource "github_repository_file" "index" {
  for_each            = var.repos
  repository          = github_repository.terraform-repo[each.key].name
  branch              = "main"
  file                = "index.html"
  content             = "Hello Terraform"
  overwrite_on_create = "true"
}

output "clone-urls" {
  value = {
    for k, repo in github_repository.terraform-repo :
    k => repo.http_clone_url
  }
}