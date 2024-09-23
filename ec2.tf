resource "aws_instance" "expense" {
    for_each = var.instance # this variable is map
    # for_each will give us a special variable with name each

  ami = "ami-09c813fb71547fc4f" # this AMI ID amy change over the time
  instance_type = each_value
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
  tags = {
    Name = each.key
  }
}
resource "aws_security_group" "allow_ssh_terraform" {
  name        = "allow_sshh" #allow_sshh is already there in my account
  description = "allow port number 22 for SSH access"
  
  #usually we allow everything in egress
  #block
  egress {
       from_port        = 0
       to_port          = 0
       protocol         = "-1"
       cidr_blocks      = ["0.0.0.0/0"]
       ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
      ipv6_cidr_blocks = ["::/0"]
    }
    tags = {
       Name = "allow_sshh" 
    }
  }