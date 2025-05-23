resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "rt" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.rt_name
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "rta" {
  subnet_id      = var.subnet_id
  route_table_id = aws_route_table.rt.id
}
