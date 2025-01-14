resource "aws_vpc" "asiaYo_test" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet_a" {
  vpc_id                  = aws_vpc.asiaYo_test.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-southeast-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_b" {
  vpc_id                  = aws_vpc.asiaYo_test.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-southeast-1b" 
  map_public_ip_on_launch = true
}

resource "aws_security_group" "eks_security_group" {
  vpc_id = aws_vpc.asiaYo_test.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}