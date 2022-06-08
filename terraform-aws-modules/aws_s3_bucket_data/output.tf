output "s3_name" {
  value = data.aws_s3_bucket.s3_bucket.bucket
}
output "s3_arn" {
  value = data.aws_s3_bucket.s3_bucket.arn
}
output "s3_bucket_domain_name" {
  value = data.aws_s3_bucket.s3_bucket.bucket_domain_name
}