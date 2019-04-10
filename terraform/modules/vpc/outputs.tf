output "instance_tenancy" {
    value = "${aws_vpc.aws_vpc.instance_tenancy}"
}

output "vpc_id" {
    value = "${aws_vpc.aws_vpc.id}"
}

output "vpc_cidr_block" {
  value = "${aws_vpc.aws_vpc.cidr_block}"
}


output "security_group_id" {
    value = "${aws_security_group.allow_all.id}"
}


#output "public_route_table_ids" {
#    value = ["${aws_route_table.nat_gateway.*.id}"]
#}

output "private_route_table_ids" {
    value = ["${aws_route_table.internet_gateway.*.id}"]
}

output "vpc-publicsubnets" {
    value = "${aws_subnet.aws_subnet_public.*.cidr_block}"
}

output "vpc-publicsubnet-id_0" {
    value = "${aws_subnet.aws_subnet_public.0.id}"
}

output "vpc-publicsubnet-ids" {
    value = "${aws_subnet.aws_subnet_public.*.id}"
}

#output "vpc-privatesubnets" {
#    value   = "${aws_subnet.aws_subnet_private.*.cidr_block}"
#}

#output "vpc-privatesubnet-ids" {
#    value = "${aws_subnet.aws_subnet_private.*.id}"
#}

#output "nat_eips" {
#    value = ["${aws_eip.aws_eip.*.id}"]
#}

#output "natgw_ids" {
#    value = ["${aws_nat_gateway.aws_nat_gateway.*.id}"]
#}

# Internet Gateway
#output "gateway_id" {
#  description = "The ID of the Internet Gateway"
#  value       = "${element(concat(aws_internet_gateway.aws_internet_gateway.*.id, list("")), 0)}"
#}

