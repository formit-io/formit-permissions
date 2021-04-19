terraform {
    source = "."

    extra_arguments "custom_vars" {
        commands = get_terraform_commands_that_need_vars()

        optional_var_files = [
            "${get_parent_terragrunt_dir()}/inputs.tfvars",
            "${get_parent_terragrunt_dir()}/inputs.${get_env("ENVIRONMENT_TYPE", "")}.tfvars"
        ]
    }
}

include {
    path = find_in_parent_folders()
}