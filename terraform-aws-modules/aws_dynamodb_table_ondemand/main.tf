####################################################################
#### Created by : Kalyan Bhave ####
#### Date : 20-Jun-2020 ####
#### Updated by : Balakrishna/ Praveen kumar/ Sathish kumar /Vinod Marpu ####
####################################################################
resource "aws_dynamodb_table" "dynamodb-terraform-lock" {
  name     = var.name
  hash_key = var.hash_key
  #   read_capacity = 5
  #   write_capacity = 5
  billing_mode   = var.billing_mode
  read_capacity  = var.billing_mode == "PROVISIONED" ? var.read_capacity : null
  write_capacity = var.billing_mode == "PROVISIONED" ? var.write_capacity : null

  attribute {
    name = var.hash_key
    type = "S"
  }

  tags = {
    Name                = "Terraform Lock Table"
    Environment         = var.environment
    app-name            = var.app-name
    team-name           = var.team-name
    created-by          = var.created-by
    ticket              = var.ticket
    cost-center         = var.cost-center
    contact-email       = var.contact-email
    created-date        = var.created-date
    resource-function   = var.resource-function
    patch-exempt        = var.patch-exempt
    data-classification = var.data-classification
  }
}