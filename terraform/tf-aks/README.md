# Terraform Kubernetes Codes

## Introduction
This repo contains the Terraform codes to create an Azure Kubernetes Service resource.

1. Export the following environment variables (update the values accordingly to your environment).
   Update `ARM_ACCESS_KEY` with the storage account key (value from `storageaccount-primary_key`).
   Update `storage_account_name` (value from `storageaccount-name`).

   ```shell
   export TF_VAR_subscription_id=<YOUR_AZURE_SUBSCRIPTION_ID>
   export TF_VAR_client_id=<YOUR_AZURE_SPN_ID>
   export TF_VAR_client_secret=<YOUR_AZURE_SPN_PASSWORD>
   export TF_VAR_tenant_id=<YOUR_AZURE_TENANT_ID>
   export ARM_ACCESS_KEY=<YOUR_STORAGE_ACCOUNT_KEY>
   ```

1. Update the `env-prod.tfvars` file appropriately.

1. Source the `init-prod.sh` file by running `source init-prod.sh` on bash

1. Run plan and apply.

    ```shell
    make plan
    make apply
    ```
After a successful run, the k8s configure file `bucketlists.k8s-config.yaml` will get created in the `./output` 
directory.

Alternative, you can also get the Kubernetes config file by running: 
`az aks get-credentials -n bucketlists-aks -g <your_resource_group>`