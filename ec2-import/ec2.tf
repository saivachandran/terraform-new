provider "aws" {

    region = "ap-south-1"
}


resource "aws_instance" "terraform-import" {

      ami = "ami-0f5ee92e2d63afc18"
      instance_type = "t2.micro"
      key_name = "elk"



     tags = {

        Name = "terraform-import"

}
    


}
