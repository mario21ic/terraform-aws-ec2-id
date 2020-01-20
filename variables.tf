variable "region" {
  description = "AWS Region"
}

variable "key_name" {
  description = "The AWS Key Pair"
}

variable "ami_id" {
  type        = "string"
  description = "AMI id"
}

variable "name" {
  type        = "string"
  default     = "Instance name"
}

variable "env" {
  type        = "string"
  description = "Environment name"
}

variable "instance_type" {
  description = "The instance type to launch"
  default = "t2.micro"
}

variable "create_public_ip" {
  default = false
  description = "Create a public ip address"
}

variable "disable_termination" {
  description = "Disable terminations"
  default = false
}

variable "volume_size" {
  description = "Volume size in gb"
  default = 30
}

variable "security_group_ids" {
  type = "list"
  description = "Security group ids"
  default = []
}

variable "iam_instance_profile" {
  type        = "string"
  description = "iam profile"
  default = ""
}

//variable "codedeploy_tag" {
//  description = "tag to codedeploy"
//}

variable "subnet_id" {
  description = "subnet id"
}

variable "private_ip" {
  description = "private ip"
}

//variable "eip" {
//  default = ""
//  description = "Elastic IP"
//}
