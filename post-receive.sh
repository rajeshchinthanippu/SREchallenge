# post-receive hook to upload to s3 bucket
#!/bin/bash
set -e
PROJ_DIR=$(dirname $PWD)
unset GIT_DIR
cd $PROJ_DIR
# Specify here , the branch whose code should be pushed to the bucket
git checkout prod
# aws cli command to sync the code
aws s3 sync $PROJ_DIR s3://www.testchallenge.in --delete --exclude ".git/*"
git checkout master