resource "github_repository" "validated_repo" {
  name        = "${var.project}-${var.env}"
  description = "Repository for ${var.project} in ${var.env} environment"
  visibility  = "private"
  auto_init   = var.auto_init
  gitignore_template = var.gitignore
}
