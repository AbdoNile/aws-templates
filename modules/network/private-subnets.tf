
variable  "private1_subnet_cidr"  {}
variable  "private2_subnet_cidr"  {}

resource "aws_subnet" "private1" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.private1_subnet_cidr}"
  availability_zone = "${var.first_az}"
  tags {
    Name = "${var.network_name} 1st Private Subnet"
  }
}

resource "aws_subnet" "private2" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.private2_subnet_cidr}"
  availability_zone = "${var.first_az}"
  tags {
    Name = "${var.network_name} 2nd private Subnet"
  }
}

resource "aws_route_table_association" "private-route-association1" {
  route_table_id = "${aws_route_table.private-network.id}"
  subnet_id      = "${aws_subnet.private1.id}"
}

resource "aws_route_table_association" "private-route-association2" {
  route_table_id = "${aws_route_table.private-network.id}"
  subnet_id      = "${aws_subnet.private2.id}"
}

