# Terraform Storage Codes

## Introduction
This repo contains the Terraform codes to create an Azure storage account and container to store the Terraform state
files. Storing state files on the cloud is a recommended practice as it allows collaborations with the team members
(locally stored state files by default won't give you this capability)

1. Export the following environment variables (update the values accordingly to your environment)
   
   ```shell
   export TF_VAR_subscription_id=<YOUR_AZURE_SUBSCRIPTION_ID>
   export TF_VAR_client_id=<YOUR_AZURE_SPN_ID>
   export TF_VAR_client_secret=<YOUR_AZURE_SPN_PASSWORD>
   export TF_VAR_tenant_id=<YOUR_AZURE_TENANT_ID>
   ```

1. Update the `env-prod.tfvars` file appropriately.

1. Source the `init-prod.sh` file by running `source init-prod.sh` on bash

1. Run plan and apply.

    ```shell
    make plan
    make apply
    ```

7. To get the storage account name and key, run:

    ```shell
    terraform show
    ```