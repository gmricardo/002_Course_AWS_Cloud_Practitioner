terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "create_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

resource "aws_instance" "create_instance_ec2" {
  ami           = "ami-0953476d60561c955" # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  tags = {
    Name        = "MyInstance"
    Environment = var.environment
  }
}