provider "aws" {
  region = "${var.region}"
}

data "template_file" "tag_codedeploy" {
  template = "${var.env}-${var.name}-CodeDeploy"
}

data "template_file" "tag_startstop" {
  template = "ec2-${var.name}-StartStop"
}

resource "aws_instance" "ec2" {
  ami                     = "${var.ami_id}"
  instance_type           = "${var.instance_type}"
  key_name                = "${var.key_name}"
  //  user_data              = "${file("get-latest.sh")}"

  vpc_security_group_ids  = ["${var.security_group_ids}"]
  subnet_id               = "${var.subnet_id}"

  associate_public_ip_address = "${var.create_public_ip}"
  private_ip             = "${var.private_ip}"

  iam_instance_profile    = "${var.iam_instance_profile}"
  disable_api_termination = "${var.disable_termination}"

  root_block_device {
    volume_size           = "${var.volume_size}"
    volume_type           = "gp2"
    delete_on_termination = "true"
  }

  tags {
    Name        = "${var.env}-ec2-${var.name}"
    Env         = "${var.env}"
    CodeDeploy  = "${data.template_file.tag_codedeploy.rendered}"
    StartStop   = "${data.template_file.tag_startstop.rendered}"
    Description = "${var.env} - ec2 - ${var.name}"
  }
}

//resource "aws_eip_association" "eip_assoc_bastion" {
//  instance_id     = "${aws_instance.ec2.id}"
//  allocation_id   = "${data.aws_eip.eip.id}"
//}
