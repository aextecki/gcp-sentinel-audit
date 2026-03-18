#!/bin/bash
#Author: Alex Mortel (Nekosec)

# 1. Define Variables (Must match the setup script)
PROJECT_ID=$(gcloud config get-value project)
SA_NAME="cloud-security-auditor"
SA_EMAIL="$SA_NAME@$PROJECT_ID.iam.gserviceaccount.com"

echo "🗑️ Starting Cleanup for Project: $PROJECT_ID"

# 2. Remove the IAM Policy Binding
# This unlinks the Service Account from the Project's Viewer role.
echo "🔓 Removing IAM Policy Binding..."
gcloud projects remove-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:$SA_EMAIL" \
    --role="roles/viewer"

# 3. Delete the Service Account
# This permanently deletes the identity we created.
echo "❌ Deleting Service Account: $SA_NAME"
gcloud iam service-accounts delete $SA_EMAIL --quiet

echo "✨ Cleanup Complete! All 'Sentinel-GCP' infrastructure has been removed."
