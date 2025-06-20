variable "repo_count" {
    type = number
    description = "Number of repositories."
    default = 1
}

variable "varsource" {
  type = string
  description = "src used to define variables" 
  default = "variables.tf"
}