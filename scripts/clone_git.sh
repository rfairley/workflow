#!/bin/bash

set -exuo pipefail

# clone_url should be passed as a https:// URL.
clone_url="${1}"
github_user="${2}"

domain=$(echo $clone_url | awk -F/ '{print $3}')
user=$(echo $clone_url | awk -F/ '{print $4}')
name=$(echo $clone_url | awk -F/ '{print $5}')

# Always want to use SSH from the $github_user's fork.
fork_url="git@github.com:${github_user}/${name}"

cd $RFAIRLEY_REPOS
mkdir -p $domain/$user
cd $domain/$user
git clone $clone_url
cd $name
git remote add "${github_user}" "${fork_url}"
