output "arn" {
  description = "ARN of the bucket"
  value       = aws_s3_bucket.fake-product-assets.arn
}

output "name" {
  description = "Name (id) of the bucket"
  value       = aws_s3_bucket.fake-product-assets.id
}

