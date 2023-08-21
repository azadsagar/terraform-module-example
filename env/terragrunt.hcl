generate "providers" {
  path      = "providers.tf"
  if_exists = "overwrite_terragrunt"

  contents = templatefile("providers.tf.tmpl", {})
}
locals {
  terraform_state_file_bucket_region      = get_env("TF_VAR_terraform_state_file_bucket_region", "us-east-1")
  terraform_state_object_path_prefix      = get_env("TF_VAR_terraform_state_object_path_prefix","demo")
  terraform_state_object_basename         = "terraform.tfstate.json"

  aws_region                               = get_env("TF_VAR_aws_region")
  terraform_state_file_bucket              = get_env("TF_VAR_terraform_state_file_bucket")
}

remote_state {
  backend = "s3"

  config = {
    // DO NOT CHANGE THE VALUES IN THIS BLOCK
    disable_bucket_update = true
    encrypt               = true

    region         = local.terraform_state_file_bucket_region
    bucket         = local.terraform_state_file_bucket

    key = join("/", [
      local.terraform_state_object_path_prefix,
      local.aws_region,
      local.terraform_state_object_basename,
    ])
  }
}

terraform {
  source = "../"

  extra_arguments "optional_vars" {
    commands = [
      "apply",
      "destroy",
      "plan"
    ]

    optional_var_files = [
      "dev.tfvars"
    ]
  }
}

