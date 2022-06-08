####################################################################
#### Created by : Kalyan Bhave ####
#### Date : 20-Jun-2020 ####
#### Updated by : Balakrishna/ Praveen kumar/ Sathish kumar ####
####################################################################
########### Auctions ###############
resource "aws_launch_template" "lc_spot" {
  name_prefix   = var.name
  image_id      = var.image_id
  instance_type = var.instance_type
  user_data     = base64encode(data.template_file.user_data.rendered)
  key_name      = var.key_name
  iam_instance_profile {
    arn = "arn:aws:iam::${var.account_id}:instance-profile/${var.instance_profile_role_name}"
  }
  monitoring {
    enabled = true
  }
  vpc_security_group_ids = var.security_group
  tag_specifications {
    resource_type = var.resource_type

    tags = {
      Created_using = var.Created_using
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
}
data "template_file" "user_data" {
  template = file("templates/${var.user_data}.tpl")
}
