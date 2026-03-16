resource "github_repository" "tf_asct_repo" {
  name        = "tf-asct-repo"
  description = "Code for tf associate"
  visibility  = "private"
  auto_init   = true
}