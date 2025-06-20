variable "project" {
  type        = string
  description = "Name of the project."
}

variable "env" {
  type        = string
  description = "Deployment environment (e.g., dev, prod)."
}

variable "auto_init" {
  type        = bool
  description = "Whether to auto initialize the repository with a README."
}

variable "gitignore" {
  type        = string
  description = "Gitignore template to use for the repository."
}

variable "github_token" {
  type        = string
  description = "GitHub personal access token."
  sensitive   = true
}
