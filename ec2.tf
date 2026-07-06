resource "aws_instance" "website_server" {
  ami                    = "ami-0de8ccbb3a0a00dba" #Amazon Linux
  instance_type          = "t3.micro"
  key_name               = "key-web-prod"
  vpc_security_group_ids = [aws_security_group.website_sg.id]
  iam_instance_profile   = "ECR-EC2-Role"
  user_data = file("user_data.sh")

  tags = {
    Name        = "website-server"
    Provisioned = "Terraform"
  }
}

# Security Group

resource "aws_security_group" "website_sg" {
  name   = "allow_tls"
  vpc_id = "vpc-05fa7cad0b39bbc00"

  tags = {
    Name        = "website-sg"
    Provisioned = "Terraform"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.website_sg.id

  cidr_ipv4   = "189.36.128.89/32"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.website_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.website_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.website_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = -1

}