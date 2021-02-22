# bucketlists

In this repository, you'll find:

1. bucketlists
1. terraform
1. helm_chart

The `bucketlists` directory contains the original bucketlists source code with the following updates:
- added `Dockerfile` to build docker image
- updated `./project/settings.py` to include the new domain

The `terraform` directory contains Terraform codes to:

- create `Azure storage account` for the centralized tf state files
- create `Azure Kubernetes Service` cluster
- install `ingress-nginx` helm chart

The `helm_chart` directory contains the helm chart to install bucketlists to Kubernetes.

```shell
cd ./bucketlists/helm_chart/bucketlists
kubectl create ns bucketlists
helm3 -n bucketlists install bucketlists ./
```


