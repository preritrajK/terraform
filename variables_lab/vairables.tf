variable "project" {
  type        = string
  description = "The name of the project"
  default     = "infrastructure"
}

variable "env" {
  type        = string
  description = "The environment name (e.g., dev, staging, prod)"
  default     = "dev"
}

variable "auto_init" {
  type        = bool
  description = "Whether to automatically initialize the repository with a README"
  # no default = required input
}

variable "gitignore_template" {
  type        = string
  description = "The .gitignore template to use"
  default     = "Terraform"
}

variable "github_token" {
  type        = string
  description = "GitHub personal access token"
  default     = "your_token_here"
}

variable "github_owner" {
  type        = string
  description = "GitHub repository owner"
  default     = "your_username"
}
