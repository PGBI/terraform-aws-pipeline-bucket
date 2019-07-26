# AWS Pipeline Bucket module

This module will create an S3 bucket that can be used by an AWS CodePipeline pipeline to store artifacts. The bucket is
configured with:
 * encryption at rest using AWS:KMS encryption with the default AWS managed S3 master key.
 * objects versioning enabled.

Usage:

```hcl
module "project" {
  source  = "PGBI/project/aws"
  version = "~>0.1.0"

  name     = "my-project"
  vcs_repo = "github.com/account/project"
}

/**
 * Creates an S3 bucket role whose name will be "prod-my-project-artifacts" if the terraform workspace is "prod".
 */
module "artifacts" {
  source  = "PGBI/pipeline-bucket/aws"
  version = "~>0.1.0"

  name    = "artifacts"
  project = module.project
}
```
