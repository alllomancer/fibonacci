variable "vpc_name" {
  type        = string
  description = "Name to be used on all the resources as identifier."
  default = "default"
}

variable "region" {
  default = "us-east-1"
  //    default = "eu-central-1"
}