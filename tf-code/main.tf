resource "random_id" "random" {
  byte_length = 2
}

resource "github_repository" "tf_asct_repo" {
  name        = "tf-asct-repo-${random_id.random.dec}"
  description = "Code for tf associate"
  visibility  = "private"
  auto_init   = true
}

resource "github_repository_file" "readme" {
  repository          = github_repository.tf_asct_repo.name
  branch              = "main"
  file                = "README.md"
  content             = "# Terraform Associate Certification"
  overwrite_on_create = true
}

resource "github_repository_file" "index" {
  repository          = github_repository.tf_asct_repo.name
  branch              = "main"
  file                = "index.html"
  content             = "Hello Terraform!"
  overwrite_on_create = true
}