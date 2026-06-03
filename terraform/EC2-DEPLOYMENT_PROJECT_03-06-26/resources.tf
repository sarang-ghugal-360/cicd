resource "aws_vpc" "sarang"{


cidr_block = var.cidr_block
tags ={
    Name = var.Name
}
}

resource "aws_subnet" "public"{
    vpc_id=aws_vpc.sarang.id
    cidr_block = var.public-subnet-cidr
    availability_zone =var.az1
    map_public_ip_on_launch = true
    tags={
        Name = vaar.public-subnet-name
    }

}

resource "aws_subnet" "private"{
    vpc_id =aws_vpc.sarang.id
    cidr_block = var.private_subnet_cidr
    availability_zone = var.az2
    tags ={
        Name = var.private_subnet_name
    }
}