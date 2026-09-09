.DEFAULT_GOAL := help

TFVARS ?= terraform.tfvars

.PHONY: help init fmt validate plan apply output destroy

help:
	@echo "Available Terraform commands:"
	@echo "  make init      Initialize Terraform"
	@echo "  make fmt       Format Terraform files"
	@echo "  make validate  Validate the Terraform configuration"
	@echo "  make plan      Show the execution plan"
	@echo "  make apply     Apply the execution plan"
	@echo "  make output    Show Terraform outputs"
	@echo "  make destroy   Destroy managed resources"

init:
	terraform init

fmt:
	terraform fmt

validate:
	terraform validate

plan:
	terraform plan --var-file=$(TFVARS)

apply:
	terraform apply --var-file=$(TFVARS)

output:
	terraform output

destroy:
	terraform destroy --var-file=$(TFVARS)
