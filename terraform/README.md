# Terraform Infrastructure Codes
## Introduction
This repo contains the Terraform codes to stand up the core infrastructure (Kubernetes along with other components) on
Azure cloud.

The tf deployment sequence is as follow:

1. storage
2. kubernetes
3. nginx-ingress

Each directory contains details of their respective components.

## Requirements
Before getting started, you will need an Azure account. Azure offers free $200 USD credit when you first sign up
([free trial link](https://azure.microsoft.com/en-us/free/)).

Then you will need to create a `service principal` (SP) account to run the Terraform codes
(instructions can be found on this
[link](https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?view=azure-cli-latest)).

