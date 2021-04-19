resource "aws_iam_policy" "policy_lambda" {
  name        = "${var.repo_name}-lambda"
  path        = "/"
  description = "Policy to allow deployment of lambda resources"
  policy      = data.aws_iam_policy_document.lambda_policy_document.json
}

data "aws_iam_policy_document" "lambda_policy_document" {
  version = "2012-10-17"
  statement {
    actions = [
      "lambda:Get*",
      "lambda:List*",
    ]
    resources = [
      "*",
    ]
  }
  statement {
    actions = [
      "lambda:AddPermission",
      "lambda:Create*",
      "lambda:Get*",
      "lambda:Invoke*",
      "lambda:List*",
      "lambda:Publish*",
      "lambda:Put*",
      "lambda:RemovePermission",
      "lambda:TagResource",
      "lambda:UntagResource",
      "lambda:Update*",
    ]
    resources = [
      "arn:aws:lambda:*:${data.aws_caller_identity.current.account_id}:function:${var.repo_name}*",
    ]
  }
}