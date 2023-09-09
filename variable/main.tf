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
}

resource "aws_s3_bucket_object" "saiva_object" {
  bucket       = aws_s3_bucket.saiva-bucket.id  # Reference to the bucket resource
  key          = "example-file.txt"             # Name of the file in the bucket
  source       = "example-file.txt"             # Path to the local file you want to upload
  content_type = "text/plain"                   # Specify the content type (e.g., text/plain)
}

