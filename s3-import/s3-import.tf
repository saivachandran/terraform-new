provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "saiva-s3-bucket" {
  bucket = "saiva-s3-bucket"
  tags = {
    name = "saiva-s3-bucket"
  }
}

resource "aws_s3_bucket_acl" "saiva-s3-bucket-acl" {
  bucket = aws_s3_bucket.saiva-s3-bucket.id

  # Define your ACL configuration here
  # For example, to set it to private:
  # grants = [{
  #   permissions = ["FULL_CONTROL"]
  #   type        = "CanonicalUser"
  #   id          = aws_s3_bucket.saiva-s3-bucket.owner_id
  # }]
}
