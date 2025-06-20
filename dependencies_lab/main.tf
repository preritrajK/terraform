resource "github_repository" "backend_repo" {
  name        = "backend"
  auto_init   = true
  visibility  = "private"
  description = "Backend code repository"
}

resource "github_branch" "backend_development" {
  repository = github_repository.backend_repo.name
  branch     = "development"
}

resource "github_repository" "frontend_repo" {
  name        = "frontend"
  auto_init   = true
  visibility  = "private"
  description = "Frontend code repository"

  # Explicit dependency on backend_repo
  depends_on = [github_repository.backend_repo]
}

resource "github_branch" "frontend_development" {
  repository = github_repository.frontend_repo.name
  branch     = "development"
}
