####################################################################
#### Created by : Kalyan Bhave ####
#### Date : 20-Jun-2020 ####
#### Updated by : Balakrishna/ Praveen kumar/ Sathish kumar ####
####################################################################
########################### Jenkins Slave Role ###########################
data "template_file" "role_template" {
  template = file("templates/${var.trust_relationship}.json.tpl")
  vars = {
    account_id = var.account_id
  }
}
resource "aws_iam_role" "role" {
  name                  = var.name
  description           = "${var.name} custom role"
  assume_role_policy    = data.template_file.role_template.rendered
  force_detach_policies = "true"
  tags = {
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

##################### Custom Policy Creation ###########################
data "template_file" "custom_policy_template" {
  template = file("templates/${var.custom_policy}.json.tpl")
  vars = {
    account_id = var.account_id
  }
}
resource "aws_iam_policy" "policy" {
  name        = var.name
  description = "${var.name} role custom policy"
  policy      = data.template_file.custom_policy_template.rendered
}
################## Jenkins Custom Policy Attachment ###################
resource "aws_iam_role_policy_attachment" "policy_attach" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}

################## Instance Profile ###################
resource "aws_iam_instance_profile" "instance_profile" {
  name = var.name
  role = aws_iam_role.role.name
}