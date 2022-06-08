####################################################################
#### Created by : Kalyan Chakravarthy ####
#### Date : 20-Jun-2020 ####
#### Updated by : Balakrishna/ Praveen kumar ####
####################################################################
########################### Jenkins Slave Role ###########################
resource "aws_instance" "ec2_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  user_data              = data.template_file.user_data.rendered
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  iam_instance_profile   = var.iam_instance_profile
  monitoring             = true
  associate_public_ip_address = var.associate_public_ip_address
  # delete_on_termination  = false

  tags = merge(
  map("Name", "${var.name}-${var.environment}")
  )
}

data "template_file" "user_data" {
  template = file("templates/${var.user_data}.tpl")
}
