####################################################################
#### Created by : Kalyan Bhave ####
#### Date : 20-Jun-2020 ####
#### Updated by : Balakrishna/ Praveen kumar/ Sathish kumar ####
####################################################################
resource "aws_route53_record" "record" {
  zone_id = var.zone_id
  name    = var.name
  type    = var.type

  alias {
    name                   = var.alias_name
    zone_id                = var.alias_zone_id
    evaluate_target_health = false
  }
}