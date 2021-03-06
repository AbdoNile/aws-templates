
variable "bastion_host_pem_key" {
  
} 

resource "aws_instance" "bastion-host" {
  ami           = "ami-050202fb72f001b47"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.public1.id}"
  security_groups = [
    "${aws_security_group.bastion-host.id}",
  ]
  key_name = "${var.bastion_host_pem_key}"
  tags {
    "Name" = "Bastion Box"
  }
}

resource "aws_security_group" "bastion-host" {
  vpc_id = "${aws_vpc.vpc.id}"

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "Bastion SG"
  }
}

