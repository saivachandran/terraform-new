provider "aws" {

   region = "ap-south-1"

}

resource "aws_instance" "test_instance" {

    ami = "ami-05ba3a39a75be1ec4"
    instance_type = "t2.micro"
    key_name = "elk"

    tags = {

       Name = "Terraform-ec2" 
    }

    root_block_device {
    volume_size = 20  # Specify the desired root volume size in GB
  }

    vpc_security_group_ids = [aws_security_group.example.id]
}
resource "aws_security_group" "example" {
  name        = "example-sg"
  description = "Example Security Group"

  # Ingress rule to open port 22 (SSH) from anywhere (0.0.0.0/0)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}    


