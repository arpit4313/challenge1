output "s3_name" {
  value = aws_s3_bucket.s3_bucket.bucket
}
output "s3_arn" {
  value = aws_s3_bucket.s3_bucket.arn
}
output "s3_bucket_domain_name" {
  value = aws_s3_bucket.s3_bucket.bucket_domain_name
}
