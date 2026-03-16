# resource "random_id" "random" {
#   byte_length = 2
#   count       = var.repo_count
# }

resource "github_repository" "tf_asct_repo" {
  for_each    = var.repos
  name        = "tf-asct-repo-${each.key}"
  description = "${each.value} code for tf associate"
  visibility  = var.env == "dev" ? "private" : "public"
  auto_init   = true
}

resource "github_repository_file" "readme" {
  for_each            = var.repos
  repository          = github_repository.tf_asct_repo[each.key].name
  branch              = "main"
  file                = "README.md"
  content             = "# Terraform Associate Certification - ${var.env}"
  overwrite_on_create = true
}

resource "github_repository_file" "index" {
  for_each            = var.repos
  repository          = github_repository.tf_asct_repo[each.key].name
  branch              = "main"
  file                = "index.html"
  content             = "Hello Terraform!"
  overwrite_on_create = true
}

output "clone-urls" {
  value       = { for i in github_repository.tf_asct_repo : i.name => i.http_clone_url }
  description = "Repository names + URL"
  sensitive   = false
}