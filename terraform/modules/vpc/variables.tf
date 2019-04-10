#-----------------------------------------------------------
# Global or/and default variables
#-----------------------------------------------------------
variable "name" {
  description = "Name to be used on all resources as prefix"
  default     = "dev"
}

variable "instance_tenancy" {
    description = "instance tenancy"
    default     = "default"
}

variable "enable_dns_support" {
    description = "Enabling dns support"
    default     = "true"
}

variable "enable_dns_hostnames" {
    description = "Enabling dns hostnames"
    default     = "true"
}

variable "assign_generated_ipv6_cidr_block" {
    description = "Generation IPv6"
    default     = "false"
}

variable "enable_classiclink" {
    description = "Enabling classiclink"
    default     = "false"
}

variable "environment" {
    description = "Environment for service"
    default     = "prod"
}

variable "orchestration" {
    description = "Type of orchestration"
    default     = "Terraform"
}

variable "createdby" {
    description = "Created by"
    default     = "Ivan Evseichik"
}
variable "private_sub" {
    description = "Private Network"
    default     = "10.10.10.0/28" 
}
variable "public_sub" {
    description = "Public Network"
    default     = "10.10.20.0/28"
}	
#    us-east-1      = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]
#    us-east-2      = ["us-east-2a", "eu-east-2b", "eu-east-2c"]
#    us-west-1      = ["us-west-1a", "us-west-1c"]
#    us-west-2      = ["us-west-2a", "us-west-2b", "us-west-2c"]
#    ca-central-1   = ["ca-central-1a", "ca-central-1b"]
#    eu-west-1      = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
#    eu-west-2      = ["eu-west-2a", "eu-west-2b"]
#    eu-central-1   = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
#    ap-south-1     = ["ap-south-1a", "ap-south-1b"]
#    sa-east-1      = ["sa-east-1a", "sa-east-1c"]
#    ap-northeast-1 = ["ap-northeast-1a", "ap-northeast-1c"]
#    ap-southeast-1 = ["ap-southeast-1a", "ap-southeast-1b"]
