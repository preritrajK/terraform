variable "project" {
  description = "Name of the project"
  type        = string

  validation {
    condition     = contains(["frontend", "infrastructure", "backend"], var.project)
    error_message = "Project must be one of: frontend, infrastructure, or backend."
  }
}

variable "env" {
  description = "Environment type"
  type        = string

  validation {
    condition     = contains(["dev", "prod"], var.env)
    error_message = "Environment must be either 'dev' or 'prod'."
  }
}

variable "auto_init" {
  description = "Whether to auto-initialize the repo"
  type        = bool
}

variable "gitignore" {
  description = "Gitignore template to use"
  type        = string

  validation {
    condition     = contains(["Terraform", "Python", "Node"], var.gitignore)
    error_message = "Gitignore must be one of: Terraform, Python, or Node."
  }
}
