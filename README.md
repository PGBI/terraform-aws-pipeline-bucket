# AWS Simple Private Bucket module

This module will create a private S3 bucket. The bucket is configured with:
 * encryption at rest using AWS:KMS encryption with the default AWS managed S3 master key.
 * objects versioning enabled by default.

A bucket created with this module can be used:
 * as an artifacts store for a Codebuild project or a CodePipeline pipeline,
 * to store the code package of a lambda function,
 * ...

## Usage

```hcl
/**
 * Initialize the project
 */
module "project" {
  source  = "PGBI/project/aws"
  version = "~>0.2.0"

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
```
