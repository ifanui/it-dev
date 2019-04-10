#---------------------------------------------------
# Define SSH key pair for our instances
#---------------------------------------------------
resource "aws_key_pair" "key_pair" {
  key_name = "${lower(var.name)}-key_pair-${lower(var.environment)}"
  public_key = "${file("${var.key_path}")}"
}
#---------------------------------------------------
# Create Jump
#---------------------------------------------------
resource "aws_instance" "instance" {
    count                       = "${var.number_of_instances}"
    ami                         = "${lookup(var.ami, var.region)}"
    instance_type               = "${var.ec2_instance_type}"
    key_name                    = "${aws_key_pair.key_pair.id}"
    monitoring                  = "${var.monitoring}"
    root_block_device {
	    volume_size           = "8"
	    volume_type           = "gp2"	
            delete_on_termination = true
}
    subnet_id                   = "${var.subnet_id}"
    private_ip                  = "10.10.20.10"	
    disable_api_termination     = "${var.disable_api_termination}"
    ebs_optimized               = "${var.ebs_optimized}"
    #security_groups             = "${var.security_groups}" 
    vpc_security_group_ids       = ["${var.vpc_security_group_ids}"]
  tags {
    Name = "Jump"
    Environment     = "${var.environment}"
    Orchestration   = "${var.orchestration}"
    Createdby       = "${var.createdby}"
  }
#############
###Provision
############
connection {
            timeout   = "2m"
            user      = "centos"
            type = "ssh"
            private_key = "${file("${var.private_key}")}"
	}
provisioner "remote-exec" {
        inline = [
	"sudo yum update -y",
	"sudo yum install epel-release -y",
        "sudo yum update -y",
	"sudo yum install python-pip python36 -y",
	"sudo uname -a"
        ]
       }
depends_on = ["aws_key_pair.key_pair"]
}
