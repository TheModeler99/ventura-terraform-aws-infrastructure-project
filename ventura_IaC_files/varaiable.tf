variable "Name" {
  type    = string
  default = "Ventura-Prod"
}

variable "vpc_cidr_block" {
    type = string
    default = "10.0.0.0/16"
}

variable "instance_tenancy" {
    description = "Used in Env with regulatory compliance and restrictions. Ensures the physical hardwares running your instances is reserved for your account alone"
    default = "dedicated" 
}

variable "subnet_configs" {
  type = map(object({
    cidr_block       = string
    availability_zone = string
  }))
  default = {
    "${var.Name}-NAT-ALB-Subnet-1" = {# Usage for Application Load Balancer and NAT gateway
      cidr_block       = "10.0.1.0/28"# 11 IPs
      availability_zone = "us-east-1a"
    }
    "${var.Name}-ALB-Subnet-2" = {# Usage for Application Load Balancer
      cidr_block       = "10.0.3.0/28"
      availability_zone = "us-east-1b"
    }
    "${var.Name}-Web-Subnet-1" = {# Usage for Web agent Servers
      cidr_block       = "10.0.5.0/23"# 507 IPs
      availability_zone = "us-east-1a"
    }
    "${var.Name}-Web-Subnet-2" = {
      cidr_block       = "10.0.10.0/23"
      availability_zone = "us-east-1b"
    }
    "${var.Name}-App-Subnet-1" = {# Usage for App agent Servers
      cidr_block       = "10.0.15.0/23"# 507 IPs
      availability_zone = "us-east-1a"
    }
    "${var.Name}-App-Subnet-2" = {
      cidr_block       = "10.0.20.0/23"
      availability_zone = "us-east-1b"
    }
    "${var.Name}-DB-Subnet-1" = {# Usage for RDS-Mysql DB
      cidr_block       = "10.0.25.0/27"# 27 IPs
      availability_zone = "us-east-1a"
    }
    "${var.Name}-DB-Subnet-2" = {
      cidr_block       = "10.0.30.0/27"
      availability_zone = "us-east-1b"
    }
  }
}
