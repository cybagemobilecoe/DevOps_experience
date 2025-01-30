#!/bin/bash

# Define file path
VERSION_FILE="version.txt"

# Read version from file
VERSION=$(cat "$VERSION_FILE")

# Extract number, increment it
NUMERIC_VERSION=$(echo "$VERSION" | grep -o '[0-9]\+')
NEW_VERSION=$((NUMERIC_VERSION + 1))

# Update the file
echo "${NEW_VERSION}+" > "$VERSION_FILE"

# Configure Git
git config --global user.email "your-email@example.com"
git config --global user.name "Azure DevOps Pipeline"

# Commit and push changes
git add "$VERSION_FILE"
git commit -m "Increment version to ${NEW_VERSION}+"
git push origin main
