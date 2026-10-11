variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Base name for resources"
  type        = string
  default     = "terraform-web"
}

variable "ami_id" {
  description = "Amazon Linux 2 AMI ID for the selected region"
  type        = string
  default     = "ami-0f918f7e67a3323f0"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ssh_cidr" {
  description = "CIDR allowed to SSH into the instance; set this to your public IP/32"
  type        = string
  default     = "127.0.0.1/32"
}
