#!/bin/bash
set -x
export ENVIRONMENT=env-prod

test -f .init.debug.sh && source .init.debug.sh

export BC_RGN=resource_group_name=azurepoc
export BC_CTN=container_name=tfstate
export BC_STG=storage_account_name=stgbucketlists
export BC_KEY=key=aks-

terraform init -var-file="$ENVIRONMENT".tfvar \
  -backend-config "$BC_RGN" \
  -backend-config "$BC_CTN" \
  -backend-config "$BC_STG" \
  -backend-config "$BC_KEY"

if ! terraform workspace new "${ENVIRONMENT}" 2>/dev/null; then
  terraform workspace select "${ENVIRONMENT}"
fi

set +x