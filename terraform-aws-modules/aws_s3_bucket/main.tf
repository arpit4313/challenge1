####################################################################
#### Created by : Kalyan Chakravarthi/ Kalyan Bhave ####
#### Date : 20-Jun-2020 ####
#### Updated by : Balakrishna/ Praveen kumar/ Sathish kumar ####
####################################################################
resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.name
  acl    = var.acl

  versioning {
    enabled = var.enable_versioning
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        #        sse_algorithm     = "aws:kms"
        sse_algorithm     = "AES256"
      }
    }
  }
}
