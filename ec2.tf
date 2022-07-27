
resource "aws_instance" "ansible_servers" {
  count         = 1
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  #securityGroup
  vpc_security_group_ids = [aws_security_group.ansible_server.id]
  #Key-pair
  key_name = "talent-academy-lab"
  #subnet
  subnet_id = data.aws_subnet.Public.id
  #EIP

  tags = {
   # Name = "Ansible Server ${count.index + 1}"
   Name = "Ansible Server"
  }
}

resource  "aws_eip" "ansible_server_ip" {
   count = 1
   # instance = aws_instance.ansible_servers[count.index].id
   instance = aws_instance.ansible_servers[0].id
    vpc      = true
}