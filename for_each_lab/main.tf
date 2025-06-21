provider "github" {
  token = var.github_token
  owner = var.github_owner
}

resource "github_repository" "repos" {
  for_each           = local.repos
  name               = each.key
  description        = each.value.description
  auto_init          = each.value.auto_init
  visibility         = each.value.visibility
  gitignore_template = each.value.gitignore_template
}

resource "github_branch" "staging_branches" {
  for_each   = local.repos
  repository = github_repository.repos[each.key].name
  branch     = each.value.branch_name
}
