resource "random_id" "random" {
  byte_length = 2
  count       = var.repo_count
}

resource "github_repository" "tf_asct_repo" {
  count       = var.repo_count
  name        = "tf-asct-repo-${random_id.random[count.index].dec}"
  description = "Code for tf associate"
  visibility  = var.env == "dev" ? "private" : "public"
  auto_init   = true
}

resource "github_repository_file" "readme" {
  count               = var.repo_count
  repository          = github_repository.tf_asct_repo[count.index].name
  branch              = "main"
  file                = "README.md"
  content             = "# Terraform Associate Certification - ${var.env}"
  overwrite_on_create = true
}

resource "github_repository_file" "index" {
  count               = var.repo_count
  repository          = github_repository.tf_asct_repo[count.index].name
  branch              = "main"
  file                = "index.html"
  content             = "Hello Terraform!"
  overwrite_on_create = true
}

output "repo-names" {
  value       = { for i in github_repository.tf_asct_repo[*] : i.name => i.http_clone_url }
  description = "Repository names + URL"
  sensitive   = false
}