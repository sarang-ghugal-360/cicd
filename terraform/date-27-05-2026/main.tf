resource "aws_vpc" "sarang"{
    cidr_block = var.vpc_cidr
    tags ={
        Name = var.Name
    }
}

resource "aws_subnet" "public"{
    vpc_id =aws_vpc.sarang.id
    cidr_block = var.public_subnet_cidr
    availability_zone = var.az1
    map_public_ip_on_launch = true
    tags ={
        name = var.public_subnet_name
    }

}

resource "aws_subnet" "private" {
    vpc_id =aws_vpc.sarang.id
    cidr_block =var.private_subnet_cidr
    availability_zone =var.az2
    tags={
        Name = "var.private-subnet"
    }
}
resource "aws_security_group" "sg"{
    vpc_id= aws_vpc.sarang.id
    ingress{
        from_port =22
        to_port =22
        protocol = "tcp"
        cidr_blocks=["0.0.0.0/0"]

    }
    egress{
        from_port =0
        to_port =0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]


    }
}


resource "aws_instance" "boss-ec2"{
    ami = var.ami_id
    instance_type =var.instance_type
    subnet_id = aws_subnet.public.id
    key_name = var.key_name
    vpc_security_group_ids =[aws_security_group.sg.id]
    tags ={
        Name = var.name-ec2
    }
}

resource "aws_s3_bucket" "my_bucket" {
    bucket = var.bucket_name
    tags={
        Name = var.bucket_name
        Environment = var.environment
    }
}
# resource "aws_s3_bucket_versioning" "version"{
#     bucket = aws_s3_bucket.my_bucket.id

# }