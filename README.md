# Terraform AWS EC2 Web Server

A clean Terraform project that provisions a public EC2 instance in AWS with:

- VPC
- Public subnet
- Internet gateway
- Route table
- Security group
- EC2 instance with Apache HTTPD

## Project Highlights

- Simple and beginner-friendly Terraform layout
- AWS infrastructure defined as code
- Public web server ready for deployment
- Security group with HTTP, HTTPS, and SSH access

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

## Prerequisites

- AWS account
- AWS Access Key ID and Secret Access Key
- Terraform v1.5+
- AWS CLI configured

## Quick Start

1. Configure AWS credentials:

```bash
aws configure
```

2. Initialize Terraform:

```bash
terraform init
```

3. Preview changes:

```bash
terraform plan
```

4. Deploy infrastructure:

```bash
terraform apply -auto-approve
```

5. Access the instance:

- Public IP is available in the Terraform output after apply.
- Visit the instance URL in your browser.

## Useful Commands

```bash
terraform validate
terraform fmt
terraform destroy -auto-approve
```

## Notes

This project is intended for learning and simple AWS deployments.
Review AWS billing and security before using it in production.

## License

This project is licensed under the MIT License.
