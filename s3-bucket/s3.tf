provider "aws" {
  region = "ap-south-1"  # Set your desired AWS region
}

resource "aws_s3_bucket" "saiva-bucket" {
  bucket = "saiva-bucket"  # Replace with your desired bucket name
  acl    = "private"  # Access Control List (ACL) for the bucket (options: private, public-read, public-read-write, etc.)

  # Optionally, you can configure other settings like versioning, logging, etc.
  versioning {
    enabled = true
  }

  # Tags (optional)
  tags = {
    Name = "MyExampleBucket"
    Environment = "Development"
  }
}
