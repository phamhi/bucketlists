#!/bin/bash
set -x
export ENVIRONMENT=env-prod

test -f .init.debug.sh && source .init.debug.sh

terraform init -var-file="$ENVIRONMENT".tfvar

if ! terraform workspace new "${ENVIRONMENT}" 2>/dev/null; then
  terraform workspace select "${ENVIRONMENT}"
fi

set +x