terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# CREATE VPC

resource "aws_vpc" "caculator-vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "Production-VPC"
  }
}

# CREATE 3 SUBNET

resource "aws_subnet" "public-subnet-1" {
  cidr_block        = var.public_subnet_1_cidr
  vpc_id            = aws_vpc.caculator-vpc.id
  availability_zone = var.availability_zones[0]

  tags = {
    Name = "Public-Subnet-1"
  }
}

resource "aws_subnet" "public-subnet-2" {
  cidr_block        = var.public_subnet_2_cidr
  vpc_id            = aws_vpc.caculator-vpc.id
  availability_zone = var.availability_zones[1]

  tags = {
    Name = "Public-Subnet-2"
  }
}

resource "aws_subnet" "public-subnet-3" {
  cidr_block        = var.public_subnet_3_cidr
  vpc_id            = aws_vpc.caculator-vpc.id
  availability_zone = var.availability_zones[2]

  tags = {
    Name = "Public-Subnet-3"
  }
}


resource "aws_subnet" "private-subnet-1" {
  cidr_block        = var.private_subnet_1_cidr
  vpc_id            = aws_vpc.caculator-vpc.id
  availability_zone = var.availability_zones[0]

  tags = {
    Name = "Private-Subnet-1"
  }
}

resource "aws_subnet" "private-subnet-2" {
  cidr_block        = var.private_subnet_2_cidr
  vpc_id            = aws_vpc.caculator-vpc.id
  availability_zone = var.availability_zones[1]

  tags = {
    Name = "Private-Subnet-2"
  }
}

resource "aws_subnet" "private-subnet-3" {
  cidr_block        = var.private_subnet_3_cidr
  vpc_id            = aws_vpc.caculator-vpc.id
  availability_zone = var.availability_zones[2]

  tags = {
    Name = "Private-Subnet-3"
  }
}

# DEFINE ROUTE TABLE FOR EACH SUBNET

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.caculator-vpc.id
  route {
    gateway_id = aws_internet_gateway.main.id
    cidr_block = "0.0.0.0/0"
  }
  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.caculator-vpc.id
  route {
    nat_gateway_id = aws_nat_gateway.main.id
    cidr_block     = "0.0.0.0/0"
  }
  tags = {
    Name = "private-route-table"
  }
}

# ASSOCIATING ROUTE TABLE WITH SUBNET

resource "aws_route_table_association" "public-subnet-table-1-association" {
  route_table_id = aws_route_table.public-route-table.id
  subnet_id      = aws_subnet.public-subnet-1.id
}

resource "aws_route_table_association" "public-subnet-table-2-association" {
  route_table_id = aws_route_table.public-route-table.id
  subnet_id      = aws_subnet.public-subnet-2.id
}

resource "aws_route_table_association" "public-subnet-table-3-association" {
  route_table_id = aws_route_table.public-route-table.id
  subnet_id      = aws_subnet.public-subnet-3.id
}

resource "aws_route_table_association" "private-subnet-table-1-association" {
  route_table_id = aws_route_table.private-route-table.id
  subnet_id      = aws_subnet.private-subnet-1.id
}

resource "aws_route_table_association" "private-subnet-table-2-association" {
  route_table_id = aws_route_table.private-route-table.id
  subnet_id      = aws_subnet.private-subnet-2.id
}

resource "aws_route_table_association" "private-subnet-table-3-association" {
  route_table_id = aws_route_table.private-route-table.id
  subnet_id      = aws_subnet.private-subnet-3.id
}

# DEFINE NAT GATEWAY

resource "aws_eip" "eip-nat" {
  tags = {
    Name = "nat_gateway_eip"
  }
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.eip-nat.id
  subnet_id     = aws_subnet.public-subnet-1.id

  tags = {
    Name = "nat_gateway_eip"
  }
}

# INTERNET GATEWAY

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.caculator-vpc.id
}
