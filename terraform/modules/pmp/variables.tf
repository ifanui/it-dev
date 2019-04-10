#-----------------------------------------------------------
# Global or/and default variables
#-----------------------------------------------------------
variable "name" {
  description = "Name to be used on all resources as prefix"
  default     = "pmp"
}

variable "region" {
  description = "The region where to deploy this code (e.g. us-east-1)."
  default     = "eu-west-3"
}

variable "environment" {
    description = "Environment for service"
    default     = "Password Pro"
}

variable "orchestration" {
    description = "Type of orchestration"
    default     = "Terraform"
}

variable "createdby" {
    description = "Created by"
    default     = "Ivan Evseichik"
}

variable "ami" {
    description = "I added only 3 regions to show the map feature but you can add all"
    type        = "map"
    default     = {
        us-east-1 = "ami-46c1b650"
        us-west-2 = "ami-46c1b650"
        eu-west-3 = "ami-0a8e17334212f7052"
    }
}

variable "number_of_instances" {
    description = "Number of instances to make"
    default     = "1"
}

variable "ec2_instance_type" {
    description = "Type of instance t2.micro, m1.xlarge, c1.medium etc"
    default     = "t2.micro"
}

variable "disk_size" {
    description = "disk size for EC2 instance"
    default     = 8
}

variable "tenancy" {
  description = "The tenancy of the instance (if the instance is running in a VPC). Available values: default, dedicated, host."
  default     = "default"
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  default     = false




}

variable "disable_api_termination" {
  description = "If true, enables EC2 Instance Termination Protection"
  default     = false
}

variable "subnet_id" {
    description = "Public subnet ID"
    #type        = "list"
}
variable "key_path" {
    description = "Key path to your RSA|DSA key"
    default     = "/root/.ssh/id_rsa.pub"
}

variable "private_key" {
    description = "Private key"
    default     = "/root/.ssh/id_rsa"
}

variable "enable_associate_public_ip_address" {
    description = "Enabling associate public ip address (Associate a public ip address with an instance in a VPC)"
    default     = "false"
}

variable "monitoring" {
    description = "If true, the launched EC2 instance will have detailed monitoring enabled"
    default     = false
}

// home directory for jenkins
variable "jenkins_home" {
  default = "/var/lib/jenkins/"
  type = "string"
}
variable "get_user_data" {
   description = "Retrieve Base64 encoded User Data contents into the user_data_base64 attribute" 
   default     = true
}
variable "user_data" {
    description = "User data in base64 format"
    default     = "IyEvYmluL2Jhc2gKc3VkbyBhcHQgdXBkYXRlIC15CnN1ZG8gYXB0IHVwZ3JhZGUgLXkKc3VkbyBhcHQgaW5zdGFsbCBtYyBuYW5vIHZpbSAteQpzdWRvIGFwdCBpbnN0YWxsIC15IHB5dGhvbi1taW5pbWFs"
}
//script for installing java
variable "script_name" {
  default = "java.sh"
  type = "string"
}

variable "ipv6_address_count" {
    description = "A number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet."
    default     = 0
}
variable "vpc_security_group_ids" {
    description = " SG for EC2"
    type        = "list"
}
variable "security_groups" {
    description = "VPC security group"
    type        = "list"
}
