output "jump_public_ip" {
    value = "${module.jump.public_ip}"
}
output "jump_private_ip" {
    value = "${module.jump.private_ip}"
}

output "pmp_private_ip" {
    value = "${module.pmp.private_ip}"
}

output "jenkins_private_ip" {
    value = "${module.jenkins.private_ip}"
}

