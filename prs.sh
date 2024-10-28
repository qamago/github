#!/bin/bash

# Replace 'your-org' with the name of your organization
ORG="your-org"

# Fetch all repositories for the organization
repos=$(gh repo list $ORG --json name --jq '.[].name')

# Loop through each repository and list its PRs
for repo in $repos; do
    echo "Repository: $ORG/$repo"
    gh pr list --repo "$ORG/$repo" --search "review:required" --limit 100
    echo
done
