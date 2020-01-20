region = "us-west-2"
name = "demo"
env = "draft"

key_name = "key_oregon"
instance_type = "t2.micro"
ami_name = "bastion_v2"
iam_instance_profile = "EC2Development"
volume_size = 40
create_public_ip = true
disable_termination = false

subnet_id = "subnet-40a1c30b"
security_group_ids = ["sg-ce8715be"]

//codedeploy_tag = "ec2-codedeploy-cron"

private_ip = "10.0.0.99"
eip = "52.11.253.140"
