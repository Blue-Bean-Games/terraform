#!/bin/sh

echo gitlab_username:

read gl_username

echo gitlab_personal_access_token:

read gl_pat

terraform init \
    -backend-config="address=https://gitlab.com/api/v4/projects/34327821/terraform/state/bbg-tfstate" \
    -backend-config="lock_address=https://gitlab.com/api/v4/projects/34327821/terraform/state/bbg-tfstate/lock" \
    -backend-config="unlock_address=https://gitlab.com/api/v4/projects/34327821/terraform/state/bbg-tfstate/lock" \
    -backend-config="username=$gl_username" \
    -backend-config="password=$gl_pat" \
    -backend-config="lock_method=POST" \
    -backend-config="unlock_method=DELETE" \
    -backend-config="retry_wait_min=5" $1
