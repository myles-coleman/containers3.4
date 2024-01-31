#!/bin/bash
REPO_OWNER="myles-coleman"
REPO_NAME="containers3.4"
GITHUB_TOKEN="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"

# Use the GitHub API to create a self-hosted runner token
RUNNER_TOKEN=$(curl -X POST -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/actions/runners/registration-token" | jq -r .token)

./config.sh --url https://github.com/myles-coleman/containers3.4 --token $RUNNER_TOKEN
./run.sh