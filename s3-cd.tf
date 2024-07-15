
resource "aws_s3_bucket" "terraform_state" {
  bucket = "${var.instance_name}-deploy"  #usado para o Code Deploy

  tags = {
    Name = "Bucket para armazenar artifacts do dpeloy"
  }
}