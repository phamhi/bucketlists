# Terraform ingress-nginx helm chart

## Introduction
This repo contains the Terraform codes to install ingress-nginx helm chart.

1. Copy the k8s config file from `./terraform/tf-aks/output/bucketlists.k8s-config.yaml` to the 
   `./terraform/tf-k8s-ingress-nginx/kube_configs/` directory.

1. Export the following environment variables (update the values accordingly to your environment).
   Update `ARM_ACCESS_KEY` with the storage account key (value from `storageaccount-primary_key`).
   Update `storage_account_name` (value from `storageaccount-name`).

   ```shell
   export ARM_ACCESS_KEY=<YOUR_STORAGE_ACCOUNT_KEY>
   ```

1. Update the `env-prod.tfvars` file appropriately.

1. Source the `init-prod.sh` file by running `source init-prod.sh` on bash

1. Run plan and apply.

    ```shell
    make plan
    make apply
    ```

