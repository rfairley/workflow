#!/bin/bash

set -exuo pipefail

clone_url=$1
fork_url=$2
REPO_LOCATION=/home/rfairley/dev-rfairley/repos/

domain=$(echo $clone_url | awk -F/ '{print $3}')
user=$(echo $clone_url | awk -F/ '{print $4}')
name=$(echo $clone_url | awk -F/ '{print $5}')

cd $REPO_LOCATION
mkdir -p $domain/$user
cd $domain/$user
git clone $clone_url
cd $name
git remote add $USER $fork_url

