data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_vpc" "current" {
  tags = {
    Name = var.vpc_name
  }
}


data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.current.id]
  }

  tags = {
    Tier = "Private"
  }
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.current.id]
  }

  tags = {
    Tier = "Public"
  }
}
