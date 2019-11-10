variable "project" {
  description = "Reference to a \"project\" module. See: https://registry.terraform.io/modules/PGBI/project/aws/"
}

variable "name" {
  type        = "string"
  description = "Bucket name."
}

variable "kms_master_key_arn" {
  type        = "string"
  description = "ARN of the custom managed AWS KMS master key. If left empty, the default `aws/s3` AWS managed master key will be used instead."
  default     = null
}

variable "enable_versioning" {
  description = "Whether or not object versioning should be enabled."
  default     = true
}
