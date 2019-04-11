# Define SSH key pair for our instances
#---------------------------------------------------
resource "aws_key_pair" "key_pair" {
  key_name = "${lower(var.name)}-key_pair-${lower(var.environment)}"
  public_key = "${file("${var.key_path}")}"
}
#---------------------------------------------------
# Create Jenkins Instance
#---------------------------------------------------
resource "aws_instance" "instance" {
    count                       = "${var.number_of_instances}"
     ami                         = "${lookup(var.ami, var.region)}"
     instance_type               = "${var.ec2_instance_type}"
     key_name                    = "${aws_key_pair.key_pair.id}"
     subnet_id                   = "${var.subnet_id}"
     private_ip                  = "10.10.10.9"
     security_groups             = ["${var.vpc_security_group_ids}"]
     vpc_security_group_ids      = ["${var.vpc_security_group_ids}"]
     monitoring                  = "${var.monitoring}"

    disable_api_termination              = "${var.disable_api_termination}"

    ebs_optimized          = "${var.ebs_optimized}"
    root_block_device {
        volume_size = "${var.disk_size}"
        volume_type = "gp2"
}

    tags {
        Name            = "Jenkins"
        Environment     = "${var.environment}"
        Orchestration   = "${var.orchestration}"
        Createdby       = "${var.createdby}"
    }
     depends_on = ["aws_key_pair.key_pair"]
}
