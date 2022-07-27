#we are building ec2 instance for the ansible server and setup security group resource
resource "aws_security_group" "ansible_server" {
    name        = "ansible-server"
    description = "Allow connection for ansible inbound traffic"
    vpc_id      = data.aws_vpc.talent-academy.id # take it from the data file and setup from the vpc in the console

    ingress { # inbound rules
    description      = "Allow port 80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["103.91.88.205/32"] # get our ip adreess from the google and specify the cidr also
   # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block] we are not using ipv6
  }

    ingress { # inbound rules   for port 22
    description      = "Allow port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["103.91.88.205/32"] # get our ip adreess from the google and specify the cidr also
   # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block] we are not using ipv6
  }
    
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

    tags = {
    Name = "ansible-server"
  }
}
