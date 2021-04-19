#!/bin/bash -e

while getopts ":r:o:e:" opt; do
  case ${opt} in
    r ) # repo name
      repo_name=$OPTARG
      ;;
    o ) # repo owner
      repo_owner=$OPTARG
      ;;
    e ) # repo email
      repo_email=$OPTARG
      ;;
    \? )
      echo "Usage: plan.sh [-r (repo name)] [-o (repo owner)] [-e (repo email)] [-a (aws account id)]"
      exit 1
      ;;
    : )
      echo "Invalid option: $OPTARG requires an argument" 1>&2
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

if [ -z "$repo_name" ]; then
  echo "Argument [-r] (repo name) not supplied."
  exit 1
fi

if [ -z "$repo_owner" ]; then
  echo "Argument [-o] (repo owner) not supplied."
  exit 1
fi

if [ -z "$repo_email" ]; then
  echo "Argument [-e] (repo email) not supplied."
  exit 1
fi

export TF_VAR_repo_name=$repo_name
export TF_VAR_github_owner=$repo_owner
export TF_VAR_repo_email=$repo_email

export PROJECT_NAME=$repo_name

mkdir -p "$GITHUB_WORKSPACE/.out/"
mkdir -p "$GITHUB_WORKSPACE/tmp/"

export TF_INPUT=false
export TERRAGRUNT_WORKING_DIR="$GITHUB_WORKSPACE/deploy/deployment-permissions"
export TERRAGRUNT_DOWNLOAD="$GITHUB_WORKSPACE/tmp/.terragrunt-cache/$repo_owner/$repo_name/$AWS_ACCOUNT_ID"

terragrunt plan -out "$GITHUB_WORKSPACE/.out/$repo_owner-$repo_name-$AWS_ACCOUNT_ID.tfplan"