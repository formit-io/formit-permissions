resource "aws_iam_policy" "policy_apigateway" {
  name        = "${var.repo_name}-apigateway"
  path        = "/"
  description = "Policy to allow deployment of apigateway resources"
  policy = data.aws_iam_policy_document.apigateway_policy_document.json
}

data "aws_iam_policy_document" "apigateway_policy_document" {
  version = "2012-10-17"
  statement {
    actions = [
      "apigateway:UpdateRestApiPolicy",
      "apigateway:PUT",
      "apigateway:PATCH",
      "apigateway:POST",
      "apigateway:GET",
      "apigateway:SetWebACL"
    ]
    resources = [
      "arn:aws:apigateway:*::*",
    ]
  }
}