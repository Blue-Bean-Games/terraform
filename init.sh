#!/bin/sh

echo gimme dat personal access token:

read pat

terraform init \
    -backend-config="address=https://gitlab.com/api/v4/projects/34327821/terraform/state/bbg-tfstate" \
    -backend-config="lock_address=https://gitlab.com/api/v4/projects/34327821/terraform/state/bbg-tfstate/lock" \
    -backend-config="unlock_address=https://gitlab.com/api/v4/projects/34327821/terraform/state/bbg-tfstate/lock" \
    -backend-config="username=zuedev" \
    -backend-config="password=$pat" \
    -backend-config="lock_method=POST" \
    -backend-config="unlock_method=DELETE" \
    -backend-config="retry_wait_min=5" $1