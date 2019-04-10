output "jump_public_ip" {
    value = "${module.jump.public_ip}"
}
output "jump_private_ip" {
    value = "${module.jump.private_ip}"
}
output "pmp_public_ip" {
    value = "${module.pmp.public_ip}"
}
output "pmp_private_ip" {
    value = "${module.pmp.private_ip}"
}
output "jenkins_public_ip" {
    value = "${module.jenkins.public_ip}"
}
output "jenkins_private_ip" {
    value = "${module.jenkins.private_ip}"
}
output "pmp_public_key" {
    value = "${module.pmp.public_key}"
}
output "jump_public_key" {
    value = "${module.jump.public_key}"
}
output "jenkins_public_key" {
    value = "${module.jenkins.public_key}"
}
