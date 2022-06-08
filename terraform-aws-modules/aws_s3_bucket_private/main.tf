####################################################################
#### Created by : Kalyan Chakravarthi/ Kalyan Bhave ####
#### Date : 20-Jun-2020 ####
#### Updated by : Balakrishna/ Praveen kumar/ Sathish kumar ####
####################################################################
resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.name
  acl    = var.acl
  tags = {
    Name        = var.name
    Environment = var.environment
  }

  versioning {
    enabled = var.enable_versioning
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        #        sse_algorithm     = "aws:kms"
        sse_algorithm = "AES256"
      }
    }
  }
}
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.s3_bucket.id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}