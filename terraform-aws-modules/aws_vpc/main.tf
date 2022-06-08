####################################################################
#### Created by : Kalyan Chakravarthi/ Kalyan Bhave ####
#### Date : 20-Jun-2020 ####
#### Updated by : Balakrishna/ Praveen kumar/ Sathish kumar ####
####################################################################
####################    VPC    ####################
data "aws_vpc" "vpc" {
  tags = {
    Name = var.vpc_id
  }
}

#################### PUB Layer ####################
data "aws_subnet" "pub_subnet_1" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name   = "tag:Name"
    values = ["${var.search_pattern}-pub-az1"]
  }
}

data "aws_subnet" "pub_subnet_2" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name   = "tag:Name"
    values = ["${var.search_pattern}-pub-az2"]
  }
}

data "aws_subnet" "pub_subnet_3" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name   = "tag:Name"
    values = ["${var.search_pattern}-pub-az3"]
  }
}

data "aws_subnet_ids" "pub" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name   = "tag:Name"
    values = ["${var.search_pattern}-pub-*"]
  }
}

#################### Data Layer ####################
data "aws_subnet" "data_subnet_1" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name   = "tag:Name"
    values = ["${var.search_pattern}-data-az1"]
  }
}

data "aws_subnet" "data_subnet_2" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name   = "tag:Name"
    values = ["${var.search_pattern}-data-az2"]
  }
}

data "aws_subnet" "data_subnet_3" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name   = "tag:Name"
    values = ["${var.search_pattern}-data-az3"]
  }
}

data "aws_subnet_ids" "data" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name   = "tag:Name"
    values = ["${var.search_pattern}-data-*"]
  }
}
#################### Private Layer ####################
data "aws_subnet" "pri_subnet_1" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name   = "tag:Name"
    values = ["${var.search_pattern}-pri-az1"]
  }
}

data "aws_subnet" "pri_subnet_2" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name   = "tag:Name"
    values = ["${var.search_pattern}-pri-az2"]
  }
}

data "aws_subnet" "pri_subnet_3" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name   = "tag:Name"
    values = ["${var.search_pattern}-pri-az3"]
  }
}

data "aws_subnet_ids" "pri" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name   = "tag:Name"
    values = ["${var.search_pattern}-pri-*"]
  }
}

####################rds##########
#data "aws_subnet" "rds_subnet_1" {
#  vpc_id = data.aws_vpc.vpc.id
#  filter {
#    name   = "tag:Name"
#    values = ["${var.search_pattern}-pri-rds-az1"]
#  }
#}
#
#data "aws_subnet" "rds_subnet_2" {
#  vpc_id = data.aws_vpc.vpc.id
#  filter {
#    name   = "tag:Name"
#    values = ["${var.search_pattern}-pri-rds-az2"]
#  }
#}
#
#data "aws_subnet" "rds_subnet_3" {
#  vpc_id = data.aws_vpc.vpc.id
#  filter {
#    name   = "tag:Name"
#    values = ["${var.search_pattern}-pri-rds-az3"]
#  }
#}
#
#data "aws_subnet_ids" "rds" {
#  vpc_id = data.aws_vpc.vpc.id
#  filter {
#    name   = "tag:Name"
#    values = ["${var.search_pattern}-pri-rds-*"]
#  }
#}
####################### redis #################################################
#data "aws_subnet" "redis_subnet_1" {
#  vpc_id = data.aws_vpc.vpc.id
#  filter {
#    name   = "tag:Name"
#    values = ["${var.search_pattern}-pri-redis-az1"]
#  }
#}
#
#data "aws_subnet" "redis_subnet_2" {
#  vpc_id = data.aws_vpc.vpc.id
#  filter {
#    name   = "tag:Name"
#    values = ["${var.search_pattern}-pri-redis-az2"]
#  }
#}
#
#data "aws_subnet" "redis_subnet_3" {
#  vpc_id = data.aws_vpc.vpc.id
#  filter {
#    name   = "tag:Name"
#    values = ["${var.search_pattern}-pri-redis-az3"]
#  }
#}
#
#data "aws_subnet_ids" "redis" {
#  vpc_id = data.aws_vpc.vpc.id
#  filter {
#    name   = "tag:Name"
#    values = ["${var.search_pattern}-pri-redis-*"]
#  }
#}
####################### compute #################################################
#data "aws_subnet" "compute_subnet_1" {
#  vpc_id = data.aws_vpc.vpc.id
#  filter {
#    name   = "tag:Name"
#    values = ["${var.search_pattern}-pri-compute-az1"]
#  }
#}
#
#data "aws_subnet" "compute_subnet_2" {
#  vpc_id = data.aws_vpc.vpc.id
#  filter {
#    name   = "tag:Name"
#    values = ["${var.search_pattern}-pri-compute-az2"]
#  }
#}
#
#data "aws_subnet" "compute_subnet_3" {
#  vpc_id = data.aws_vpc.vpc.id
#  filter {
#    name   = "tag:Name"
#    values = ["${var.search_pattern}-pri-compute-az3"]
#  }
#}
#
#data "aws_subnet_ids" "compute" {
#  vpc_id = data.aws_vpc.vpc.id
#  filter {
#    name   = "tag:Name"
#    values = ["${var.search_pattern}-pri-compute-*"]
#  }
#}