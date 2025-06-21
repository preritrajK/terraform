variable "repo_max" {
  type        = number
  description = "Number of repositories."
  default     = 2

  validation {
    condition     = var.repo_max <= 10
    error_message = "Do not deploy more than 10 repos"
  }
}

variable "env" {
  type        = string
  description = "Deployment environment"
  validation {
    #condition     = var.env == "dev" || var.env == "prod"
    condition     = contains(["dev", "prod"], var.env)
    error_message = "Env must be 'dev' or 'prod'"
  }
}

# variable "visibility" {
#   type = string
#   description = "Visibility of a repo"  
#   default = var.env == "dev" ? "private" : "public"
# }

variable "repos" {
  type        = set(string)
  description = "Repos"
  validation {
    condition     = length(var.repos) <= var.repo_max
    error_message = "Do not deploy more than repo max allows"
  }
}