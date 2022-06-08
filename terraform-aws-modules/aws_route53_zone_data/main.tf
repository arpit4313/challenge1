####################################################################
#### Created by : Kalyan Bhave ####
#### Date : 20-Jun-2020 ####
#### Updated by : Balakrishna/ Praveen kumar/ Sathish kumar ####
####################################################################
data "aws_route53_zone" "domain" {
  name         = var.name
  private_zone = var.private_zone
}