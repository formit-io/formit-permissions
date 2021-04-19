resource "github_repository" "repo" {
  name = var.repo_name
  has_issues = true
  visibility = "public"
  allow_merge_commit = false
  allow_rebase_merge = false
  allow_squash_merge = true
  delete_branch_on_merge = true
  has_projects = false
  has_downloads = false
  has_wiki = false
  license_template = "mit"
  auto_init = true
  vulnerability_alerts = true
}

resource "github_actions_secret" "aws_access_key_id" {
  repository       = github_repository.repo.name
  secret_name      = "AWS_ACCESS_KEY_ID"
  plaintext_value  = aws_iam_access_key.pipeline-access-key.id
}

resource "github_actions_secret" "aws_secret_access_key" {
  repository       = github_repository.repo.name
  secret_name      = "AWS_SECRET_ACCESS_KEY"
  plaintext_value  = aws_iam_access_key.pipeline-access-key.secret
}