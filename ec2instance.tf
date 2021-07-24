provider "aws" {
  region = "us-east-1"
}
resource "aws_key_pair" "tf-demo" {
  key_name   = "tf-demo"
  public_key = file("tf-demo.pub")
}
resource "aws_instance" "my-instance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.tf-demo.key_name
  user_data     = file("install_apache.sh")
  tags = {
    Name = "Terraform"
  }
}
