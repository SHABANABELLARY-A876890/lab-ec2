data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    #copy the value from the aws console under ami and remove the data entry from console
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"] 
  }

  owners = ["099720109477"] # Canonical
}

#create a data from aws_vpc aa
data "aws_vpc" "talent-academy" {
  filter {
    name   = "tag:Name" # please specify that vpc name is the tag
    values = ["lab-vpc"]
  }
}

data "aws_subnet" "Public" {
  filter {
    name   = "tag:Name" # please specify that vpc name is the tag
    values = ["Public"]
  }
}