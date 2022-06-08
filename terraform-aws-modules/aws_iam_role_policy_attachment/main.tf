####################################################################
#### Created by : Kalyan Bhave ####
#### Date : 20-Jun-2020 ####
#### Updated by : Balakrishna/ Praveen kumar/ Sathish kumar ####
####################################################################
resource "aws_iam_role_policy_attachment" "attach" {
  role       = var.role
  policy_arn = var.policy_arn
}