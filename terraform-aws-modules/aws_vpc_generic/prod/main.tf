provider "aws" {
  region = var.region
  assume_role {
    role_arn = "arn:aws:iam::${var.account_id}:role/z5x_jenkins"
  }
}
provider "aws" {
  region = var.region
  alias = "peer"
  assume_role {
    role_arn = "arn:aws:iam::${var.account_id}:role/z5x_jenkins"
  }
}