terraform {
  backend "s3" {
    bucket = "server-challenge-state-01" # substitua pelo nome único do seu bucket S3
    key    = "terraform.tfstate"   # nome do arquivo de estado no bucket
    region = "us-east-1"           # substitua pela região do seu bucket S3
  }
}

