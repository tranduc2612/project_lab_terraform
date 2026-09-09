# AWS Terraform Lab

Terraform project that creates an AWS EC2 instance, Elastic IP, SSH key pair, and security group in the `us-east-1` region.

## Prerequisites

- An AWS account with permissions to create EC2, Elastic IP, key pair, and security group resources.
- Terraform installed and available in `PATH`.
- AWS credentials configured locally. For example:

```bash
aws configure
```

The public key file `keypair.pub` must exist in the project directory. Do not commit private credentials or the private key file.

## Run the project

From the `lab-1` directory:

```bash
cd lab-1
make init
make validate
make plan
make apply
```

Review the plan before confirming `make apply`.

## View outputs

After deployment, display the instance and security group values:

```bash
make output
```

The outputs include:

- `instance_public_eip`: Elastic IP assigned to the EC2 instance
- `instance_private_ip`: Private IP of the EC2 instance
- `security-group`: Security group ID

## Configuration

The current module defaults are:

```hcl
image_id      = "ami-081b0a6eac00b4f53"
instance_type = "t3.micro"
```

These values are defined in `modules/compute/variable.tf`. The root `terraform.tfvars` file contains the same names, but the root module does not currently declare or pass those variables to the compute module, so the module defaults are used.

To use another variable file, first declare and pass the variables in the root module, then run:

```bash
make plan TFVARS=staging.tfvars
make apply TFVARS=staging.tfvars
```

The AMI must be available in the configured AWS region.

## Format and validate

```bash
make fmt
make validate
```

## Clean up

Destroy all resources created by this project when they are no longer needed:

```bash
make destroy
```

Review the destruction plan and confirm when prompted.
