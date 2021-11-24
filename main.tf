# vpc
resource "aws_vpc" "main-vpc" {
    cidr_block = var.vpc_cidr
    tags = {
        name = var.vpc_name
    }
}

# IGW
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    Name = var.internet_gateway
  }
}

# Public Subnets
resource "aws_subnet" "public_a" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = var.public_a_cidr
  map_public_ip_on_launch = true
  availability_zone = "${var.region}a"

  tags = {
    Name = "Talent-academy-public-a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = var.public_b_cidr
  map_public_ip_on_launch = true
availability_zone = "${var.region}b"

  tags = {
    Name = "Talent-academy-public-b"
  }
}

resource "aws_subnet" "public_c" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = var.public_c_cidr
  map_public_ip_on_launch = true
availability_zone = "${var.region}c"

  tags = {
    Name = "Talent-academy-public-c"
  }
}
#  Private Subnets
resource "aws_subnet" "private_a" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = var.private_a_cidr
  availability_zone = "${var.region}a"

  tags = {
    Name = "Talent-academy-private-a"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = var.private_b_cidr
  availability_zone = "${var.region}b"

  tags = {
    Name = "Talent-academy-private-b"
  }
}

resource "aws_subnet" "private_c" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = var.private_c_cidr
  availability_zone = "${var.region}c"

  tags = {
    Name = "Talent-academy-private-c"
  }
}

# Elastic IP ADDRESSES
resource "aws_eip" "nat_a_eip" {
  vpc      = true
}

resource "aws_eip" "nat_b_eip" {
  vpc      = true
}

resource "aws_eip" "nat_c_eip" {
  vpc      = true
}
# PUBLIC NAT GATEWAYS

resource "aws_nat_gateway" "nat_a" {
  allocation_id = aws_eip.nat_a_eip.id
  subnet_id     = aws_subnet.public_a.id

  tags = {
    Name = "NAT GATEWAY A"
  }

  depends_on = [aws_internet_gateway.internet_gateway]
}

resource "aws_nat_gateway" "nat_b" {
  allocation_id = aws_eip.nat_b_eip.id
  subnet_id     = aws_subnet.public_b.id

  tags = {
    Name = "NAT GATEWAY B"
  }

  depends_on = [aws_internet_gateway.internet_gateway]
}

resource "aws_nat_gateway" "nat_c" {
  allocation_id = aws_eip.nat_c_eip.id
  subnet_id     = aws_subnet.public_c.id

  tags = {
    Name = "NAT GATEWAY C"
  }

  depends_on = [aws_internet_gateway.internet_gateway]
}


