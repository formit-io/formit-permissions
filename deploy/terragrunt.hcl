locals {
    email = "aws@formit.io"
    project_name = get_env("PROJECT_NAME", "")
    module_name = path_relative_to_include()
    account_id  = get_env("AWS_ACCOUNT_ID", "")
    repository_name = "formit-permissions-aws"
    resource_tags = {
        "repo:name" = local.repository_name
        "repo:email" = local.email
    }
}

remote_state {
    backend = "s3"

    config = {
        bucket = "${local.repository_name}-terraform-state"
        key = "${local.account_id}/${local.project_name}/terraform.tfstate"
        region = "eu-west-1"
        encrypt = true
        s3_bucket_tags = local.resource_tags
    }
}