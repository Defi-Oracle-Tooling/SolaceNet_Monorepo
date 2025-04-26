#!/bin/bash

# Auto-release tagging script for SolaceNet Monorepo

# Ensure the script is run from the main branch
git checkout main

echo "Pulling the latest changes..."
git pull

# Prompt for the release version
read -p "Enter the release version (e.g., v1.0.0): " version

# Create a new tag
echo "Creating a new tag: $version"
git tag -a "$version" -m "Release $version"

echo "Pushing the tag to the remote repository..."
git push origin "$version"

echo "Release $version has been tagged and pushed successfully!"
