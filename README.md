# Terraform AWS EC2 Web Server

<div align="center">

[![Terraform](https://img.shields.io/badge/Terraform-v1.5%2B-7B42BC?style=for-the-badge&logo=terraform)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-EC2%20%7C%20VPC-FF9900?style=for-the-badge&logo=amazonaws)](https://aws.amazon.com/)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)

</div>

A clean and beginner-friendly Terraform project that provisions a public EC2 instance on AWS with networking and security in place.

## Overview

This project creates a simple production-style AWS environment consisting of:

- VPC
- Public subnet
- Internet gateway
- Route table
- Security group
- EC2 instance running Apache HTTPD

It is ideal for learning Infrastructure as Code, AWS networking, and Terraform automation.

## Architecture

```text
Internet
   |
   v
AWS VPC
  ├── Public Subnet
  │    └── EC2 Instance
  └── Internet Gateway
```

## Features

- Infrastructure defined entirely in Terraform
- Public-facing EC2 instance
- HTTP and HTTPS enabled
- SSH access enabled via security group
- Simple structure suitable for learning and demos

## Prerequisites

Before running this project, make sure you have:

- An AWS account
- AWS access key and secret key
- Terraform v1.5 or newer
- AWS CLI configured locally

## Quick Start

1. Configure AWS credentials

```bash
aws configure
```

2. Initialize the working directory

```bash
terraform init
```

3. Preview the planned AWS resources

```bash
terraform plan
```

4. Deploy the environment

```bash
terraform apply -auto-approve
```

5. Access the EC2 instance

- Get the public IP from the Terraform output
- Open the browser and visit the instance URL

## Useful Commands

```bash
terraform validate
terraform fmt
terraform show
terraform destroy -auto-approve
```

## File Structure

```text
terraform-aws-ec2/
├── .github/
│   └── workflows/
│       └── terraform.yml
├── .gitignore
├── LICENSE
├── README.md
├── ec2.tf
├── main.tf
├── network.tf
├── provider.tf
├── security.tf
├── terraform.tfvars.example
├── variables.tf
└── .terraform/
```

## Notes

This project is designed for learning and simple AWS deployments. Always review IAM permissions, AWS billing, and security settings before using it in a production environment.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
