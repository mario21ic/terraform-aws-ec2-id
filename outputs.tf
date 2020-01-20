output "ec2_id" {
  value = "${aws_instance.ec2.id}"
}

output "public_ip" {
  value = "${aws_instance.ec2.public_ip}"
}

output "private_ip" {
  value = "${aws_instance.ec2.private_ip}"
}

output "tag_codedeploy" {
  value = "${data.template_file.tag_codedeploy.rendered}"
}

output "tag_startstop" {
  value = "${data.template_file.tag_startstop.rendered}"
}