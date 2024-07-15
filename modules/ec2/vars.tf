variable "ami_id" {
  default = "ami-04b70fa74e45c3917"
}

variable "instance_type" {
  default = "t2.micro"
}
variable "vpc_id" {
  type = string
}
variable "security_group_id" {
  type = string
}
variable "public_subnet_id" {
  type = string
}

variable "name_ec2" {
  type = string
}

variable "key_pair" {
  type = string
}



variable "user_data_file" {
  description = "The path to the user data script file"
  type        = string
  default     = "script.sh"  
}
