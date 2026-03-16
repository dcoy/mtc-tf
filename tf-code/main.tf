resource "random_id" "random" {
  byte_length = 2
  count       = 2
}

resource "github_repository" "tf_asct_repo" {
  count       = 2
  name        = "tf-asct-repo-${random_id.random[count.index].dec}"
  description = "Code for tf associate"
  visibility  = "private"
  auto_init   = true
}

resource "github_repository_file" "readme" {
  count               = 2
  repository          = github_repository.tf_asct_repo[count.index].name
  branch              = "main"
  file                = "README.md"
  content             = "# Terraform Associate Certification"
  overwrite_on_create = true
}

resource "github_repository_file" "index" {
  count               = 2
  repository          = github_repository.tf_asct_repo[count.index].name
  branch              = "main"
  file                = "index.html"
  content             = "Hello Terraform!"
  overwrite_on_create = true
}