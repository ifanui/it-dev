#
terraform {
  required_version = "> 0.9.0"
}
provider "aws" {
    region  = "eu-west-3"
    profile = "default"
}

module "vpc" {
    source                              = "../modules/vpc"
    environment                         = "dev"
}
module "jenkins" {
    source                              = "../modules/jenkins"
    environment                         = "dev"
    subnet_id                           = "${element(module.vpc.vpc-privatesubnet-ids, 0)}"
    security_groups                     = ["${module.vpc.security_group_id}"]
    vpc_security_group_ids              = ["${module.vpc.security_group_id}"]
}
module "jump" {
    source                              = "../modules/jump"
    environment                         = "dev"
    subnet_id                           = "${element(module.vpc.vpc-publicsubnet-ids, 0)}"
    security_groups                     = ["${module.vpc.security_group_id}"]
    vpc_security_group_ids              = ["${module.vpc.security_group_id}"]
}
module "pmp" {
    source                              = "../modules/pmp"
    environment                         = "dev"
    subnet_id                           = "${element(module.vpc.vpc-privatesubnet-ids, 0)}"
    security_groups                     = ["${module.vpc.security_group_id}"]
    vpc_security_group_ids              = ["${module.vpc.security_group_id}"]
}
