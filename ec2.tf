provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn     = "arn:aws:iam::181541241057:role/cross-account-developer"
    session_name = "SESSION_NAME"
    external_id  = "EXTERNAL_ID"
  }
  profile="zaloni"
}

resource "aws_security_group" "arsh-sg" {
  name        = "arsh-sg"
  description = "Security Group For Visual Instance"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {  
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5601
    to_port     = 5601
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ArshTerraformVisualInstance" {
  ami             = "ami-0c6b1d09930fac512"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.arsh-sg.name}"]
  key_name        = "arshdeep"
  tags = {
    Name = "ArshTerraformVisualInstance"
  }
}

resource "aws_instance" "ArshTerraformWebInstance" {
  ami             = "ami-0c6b1d09930fac512"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.arsh-sg.name}"]
  key_name        = "arshdeep"
  tags = {
    Name = "ArshTerraformWebInstance"
  }
}