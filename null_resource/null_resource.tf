provider "aws" {

   region = "ap-south-1"

}

resource "aws_instance" "example_instance" {

    ami = "ami-05ba3a39a75be1ec4"
    instance_type = "t2.micro"
    key_name = "elk"

    tags = {

       Name = "example_instance" 
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


# Local provisioner to run a local command
resource "null_resource" "local_provisioner" {
  triggers = {
    instance_id = aws_instance.example_instance.id
  }

  provisioner "local-exec" {
    command = "echo 'Hello from a local-exec provisioner'"
  }
}
# Remote provisioner to run a command on the EC2 instance
resource "null_resource" "remote_provisioner" {
  triggers = {
    instance_id = aws_instance.example_instance.id
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello from a remote-exec provisioner'",
      # Add more commands as needed
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"          # Replace with your SSH user
      private_key = file("~/.ssh/elk.pem")  # Replace with your SSH private key
      host        = aws_instance.example_instance.public_ip  # Use public IP of the EC2 instance
    }
  }
}

