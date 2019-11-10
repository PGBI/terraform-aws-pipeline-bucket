output "arn" {
  description = "ARN of the bucket."
  value       = aws_s3_bucket.main.arn
}

output "name" {
  description = "The name of the bucket."
  value       = aws_s3_bucket.main.bucket
}

output "id" {
  description = "The name of the bucket."
  value       = aws_s3_bucket.main.id
}
