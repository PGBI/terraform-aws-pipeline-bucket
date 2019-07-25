/**
 * The KMS key for the bucket encryption.
 */
module "key" {
  source  = "PGBI/kms-key/aws"
  version = "~>0.1.0"

  description = "Used for the encryption of the s3 bucket \"${var.project.name_prefix}-${var.name}\""
  name        = "${var.name}-bucket"
  project     = var.project
}

/**
 * The S3 bucket.
 */
resource "aws_s3_bucket" "main" {
  acl           = "private"
  bucket_prefix = "${var.project.name_prefix}-${var.name}-"
  force_destroy = true
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = module.key.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
  versioning {
    enabled = true
  }
  tags = var.project.tags
}
