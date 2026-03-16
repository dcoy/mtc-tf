variable "repo_max" {
  type        = number
  description = "Number of repositories"
  default     = 2

  validation {
    condition     = var.repo_max <= 10
    error_message = "Don't deploy more than 10 repositories"
  }
}

variable "env" {
  type        = string
  description = "deployment environment"
  validation {
    condition     = contains(["dev", "prod"], var.env)
    error_message = "❌ Env must be dev or prod"
  }
}

variable "repos" {
  type        = set(string)
  description = "Repository environment"
  validation {
    condition = length(var.repos) <= var.repo_max
    error_message = "Max number of repos is greater than ${var.repo_max}"
  }
}
