variable "region" {
  default = "us-east-1"
}

variable "profile" {
  default = "default"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_name" {
  default = "server-challenge"
}


variable "key_pair" {
  default = "key-challenge"
  
}
variable "user_data_file" {
  description = "The path to the user data script file"
  type        = string
  default     = "script.sh"  
}
