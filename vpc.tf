locals {
  tags = {
    Name = "Name"
  }
}

resource "aws_vpc" "main" {               #you can put any name here 
  cidr_block = var.vpc_cidr_block

  tags = local.tags
}

resource "aws_subnet" "public_1" {         #you can put any name here 
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_1
  availability_zone = var.az_subnet_1

  tags = merge({
    Name = "Public"
  },local.tags)
}

resource "aws_subnet" "public_2" {          #you can put any name here
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_2
  availability_zone = var.az_subnet_2

  tags = {
    Name = "Public"      #you can put any name here 
  }
}

resource "aws_subnet" "private" {                 #you can put any name here 
  vpc_id            = aws_vpc.main.id #resource dependancy
  cidr_block        = var.subnet_cidr_private
  availability_zone = var.az_private_subnet

  tags = {
    Name = "Private"            #you can put any name here 
  }
}

resource "aws_internet_gateway" "gw" {             #you can put any name here
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"            #you can put any name here
  }
}

resource "aws_route_table" "example" {           #you can put any name here 
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"                    #you can specify here of your choice
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "example"              #you can put any name here 
  }
}

resource "aws_route_table_association" "a" {            #you can put any name here 
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.example.id
}

resource "aws_route_table_association" "b" {           #you can put any name here 
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.example.id
}
