module "route53_zone" {
  source       = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_route53_zone_data?ref=main"
  name         = "zee5.com"
  private_zone = false
}
module "route53_record" {
  source        = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_route53_record?ref=main"
  alias_name    = module.alb.alb_arn_dns_name
  alias_zone_id = module.alb.alb_arn_zone_id
  name          = "zee5-b2b-adminpanel-${var.environment}.${module.route53_zone.route53_zone_domain_name}"
  type          = "A"
  zone_id       = module.route53_zone.route53_zone_domain_id
}
