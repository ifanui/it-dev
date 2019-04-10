#
terraform {
  required_version = "> 0.9.0"
}
provider "aws" {
    region  = "eu-west-3"
    profile = "default"
}

module "vpc" {
    source                              = "../../aws/modules/vpc"
    environment                         = "dev"
}
module "jenkins" {
    source                              = "../../aws/modules/jenkins"
    environment                         = "dev"
    subnet_id                           = "${element(module.vpc.vpc-publicsubnet-ids, 0)}"
    security_groups                     = ["${module.vpc.security_group_id}"]
    vpc_security_group_ids              = ["${module.vpc.security_group_id}"]
}
module "jump" {
    source                              = "../../aws/modules/jump"
    environment                         = "dev"
    subnet_id                           = "${element(module.vpc.vpc-publicsubnet-ids, 0)}"
    security_groups                     = ["${module.vpc.security_group_id}"]
    vpc_security_group_ids              = ["${module.vpc.security_group_id}"]
}
module "pmp" {
    source                              = "../../aws/modules/pmp"
    environment                         = "canvas"
    subnet_id                           = "${element(module.vpc.vpc-publicsubnet-ids, 0)}"
    security_groups                     = ["${module.vpc.security_group_id}"]
    vpc_security_group_ids              = ["${module.vpc.security_group_id}"]
}
