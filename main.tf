terraform {
  required_version = ">= 0.12"
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
        kms_master_key_id = var.kms_master_key_arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
  versioning {
    enabled = true
  }
  tags = var.project.tags
}
