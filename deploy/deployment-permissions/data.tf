data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "github_actions_public_key" "formit-api" {
  repository = github_repository.repo.name
}
