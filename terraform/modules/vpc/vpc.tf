#--------------------------------------------------
#AWS login
#---------------------------------------------------
terraform {
  required_version = "> 0.9.0"
}
provider "aws" {
    region  = "eu-west-3"
    profile = "default"
}
#---------------------------------------------------
# Create VPC
#---------------------------------------------------
resource "aws_vpc" "aws_vpc" {
    cidr_block                          = "10.10.0.0/16"
    instance_tenancy                    = "default"
    enable_dns_support                  = "true"
    enable_dns_hostnames                = "true"
    assign_generated_ipv6_cidr_block    = "false"
    enable_classiclink                  = "false"
    tags {
        Name            = "devops-vpc"
    }
}
resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = "${aws_vpc.aws_vpc.id}"
  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }  
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
    tags = {
      Name = "allow_all"
         }
}
#---------------------------------------------------
# Add AWS subnet (private)
#---------------------------------------------------
resource "aws_subnet" "aws_subnet_private" {
    cidr_block              = "${var.private_sub}"
    vpc_id                  = "${aws_vpc.aws_vpc.id}"
    map_public_ip_on_launch = "false"
    availability_zone       = "eu-west-3a"
    tags {
        Name            = "devops_private"
    }
}
#---------------------------------------------------
# Add AWS subnet (public)
#---------------------------------------------------
resource "aws_subnet" "aws_subnet_public" {
    cidr_block              = "${var.public_sub}"
    vpc_id                  = "${aws_vpc.aws_vpc.id}"
    map_public_ip_on_launch = "true"
    availability_zone       = "eu-west-3a"
    tags {
        Name            = "devops_public"
    }
}
#---------------------------------------------------
# Add AWS internet gateway
#---------------------------------------------------
resource "aws_internet_gateway" "aws_internet_gateway" {
    vpc_id = "${aws_vpc.aws_vpc.id}"
    tags {
        Name            = "internet-gateway-devops"
    }
}
#---------------------------------------------------
# CREATE EIP
#---------------------------------------------------
resource "aws_eip" "aws_eip" {
    vpc         = true
    depends_on = ["aws_internet_gateway.aws_internet_gateway"]
}
#---------------------------------------------------
# CREATE NAT
#---------------------------------------------------
resource "aws_nat_gateway" "aws_nat_gateway" {
    allocation_id = "${aws_eip.aws_eip.id}"
    subnet_id = "${aws_subnet.aws_subnet_public.id}"
    depends_on = ["aws_internet_gateway.aws_internet_gateway"]
}
#---------------------------------------------------
# Create public route table and the route to the internet
#---------------------------------------------------
resource "aws_route_table" "internet_gateway" {
    vpc_id = "${aws_vpc.aws_vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.aws_internet_gateway.id}"
    }
    tags {
        Name            = "devops_internet_gateway"
        Environment     = "${var.environment}"
        Orchestration   = "${var.orchestration}"
        Createdby       = "${var.createdby}"
    }
}
##---------------------------------------------------
# Create private route table and the route to the internet
#---------------------------------------------------
resource "aws_route_table" "nat_gateway" {
    vpc_id = "${aws_vpc.aws_vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_nat_gateway.aws_nat_gateway.id}"
    }
    tags {
        Name            = "devops_nat_gateway"
        Environment     = "${var.environment}"
        Orchestration   = "${var.orchestration}"
        Createdby       = "${var.createdby}"
    }
}
#---------------------------------------------------
# Route Table Associations
#---------------------------------------------------
# private
resource "aws_route_table_association" "aws_route_table_association_private" {
    subnet_id       = "${aws_subnet.aws_subnet_private.id}"
    route_table_id  = "${aws_route_table.nat_gateway.id}"
}
# public
resource "aws_route_table_association" "aws_route_table_association" {
    subnet_id       = "${aws_subnet.aws_subnet_public.id}"
    route_table_id  = "${aws_route_table.internet_gateway.id}"
}
