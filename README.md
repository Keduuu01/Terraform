# Terraform AWS EC2 Web Server

A hands-on Infrastructure as Code project that provisions a basic public web server on AWS using Terraform.

## Project status

**Learning / portfolio project.** Run the validation and deployment steps below in your own AWS account before describing the infrastructure as successfully deployed.

## Architecture

```text
Internet
   |
Internet Gateway
   |
Public Route Table
   |
Public Subnet (10.0.1.0/24)
   |
EC2 instance (Apache HTTP Server)
   |
Security Group
```

Terraform provisions:
- VPC with DNS support and DNS hostnames
- Public subnet and internet gateway
- Public route table and subnet association
- Security group for SSH, HTTP, HTTPS, and outbound traffic
- EC2 instance with Apache installed through user data
- Configurable AWS region, project name, AMI ID, instance type, and SSH CIDR

## Repository structure

```text
.
├── .github/workflows/terraform.yml
├── .gitignore
├── LICENSE
├── README.md
├── ec2.tf
├── main.tf
├── network.tf
├── provider.tf
├── security.tf
├── terraform.tfvars.example
└── variables.tf
```

## Prerequisites

- Terraform 1.5 or later
- AWS CLI configured with an IAM identity that has the required permissions
- An AWS account and a valid AMI ID for the selected region

Do not use AWS root credentials for routine deployment. Use an appropriately scoped IAM identity or role.

## Configure

1. Clone the repository and enter its directory.
2. Configure AWS credentials using your normal AWS CLI/profile workflow.
3. Copy the example variables file:

   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

4. Edit `terraform.tfvars`:
   - Confirm the AMI ID is valid for your chosen region.
   - Set `ssh_cidr` to your current public IP in CIDR notation, usually `YOUR_PUBLIC_IP/32`. Do not leave SSH open to the entire internet.

## Validate and deploy

Review each plan before applying. These commands can create billable AWS resources.

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
terraform apply
```

After deployment, retrieve the instance public IP from the EC2 console and visit `http://PUBLIC_IP`. The user-data script installs Apache and writes a simple landing page. HTTPS ingress is allowed by the security group, but this project does not configure a TLS certificate or HTTPS server.

To remove the resources created by this configuration:

```bash
terraform destroy
```

Review the plan carefully before confirming destruction.

## Security notes

- Restrict SSH (TCP 22) to your own public IP using `ssh_cidr`.
- The web-server security group allows inbound HTTP and HTTPS from the internet. Only expose ports your application needs.
- The HTTPS rule alone does not enable TLS; a certificate and HTTPS server configuration are required.
- Never commit AWS credentials, real `.tfvars` files, Terraform state, or secrets.
- This is a learning project, not a production-ready reference architecture. Consider private subnets, managed access, least-privilege IAM, logging, monitoring, and stronger deployment controls before production use.

## Next improvements

- Add Terraform outputs for the instance public IP and website URL.
- Add automated formatting and validation in CI.
- Add a verified architecture diagram and deployment evidence after testing.

## License

MIT — see [LICENSE](LICENSE).
