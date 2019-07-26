/**
 * Configure the AWS Provider
 */
provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

/**
 * Initialize the project
 */
module "project" {
  source  = "PGBI/project/aws"
  version = "~>0.1.0"

  name     = "myproject"
  vcs_repo = "github.com/account/project"
}

/**
 * Creates an S3 bucket role whose name will be "prod-myproject-artifacts" if the terraform workspace is "prod".
 */
module "artifacts" {
  source  = "PGBI/simple-private-bucket/aws"
  version = "~>0.1.0"

  name    = "artifacts"
  project = module.project
}
