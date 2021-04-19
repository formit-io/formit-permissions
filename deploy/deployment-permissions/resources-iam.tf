resource "aws_iam_user" "pipeline-user" {
  name = "${var.repo_name}-pipeline"
  tags = local.common_tags
}

resource "aws_iam_access_key" "pipeline-access-key" {
  user = aws_iam_user.pipeline-user.name
}