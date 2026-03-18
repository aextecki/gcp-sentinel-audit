#!/bin/bash
#Author: Alex Mortel (Nekosec)

# 1. Define Variables
PROJECT_ID=$(gcloud config get-value project)
SA_NAME="cloud-security-auditor"
SA_DISPLAY_NAME="GCP Security Audit Service Account"

echo "🚀 Starting environment setup for Project: $PROJECT_ID"

# 2. Enable Required APIs (These are Free Tier friendly!)
echo "🔗 Enabling Resource Manager and Compute APIs..."
gcloud services enable cloudresourcemanager.googleapis.com compute.googleapis.com storage.googleapis.com

# 3. Create a Service Account for the Python Auditor
# This follows the principle of Least Privilege.
echo "👤 Creating Service Account: $SA_NAME"
gcloud iam service-accounts create $SA_NAME --display-name "$SA_DISPLAY_NAME"

# 4. Assign "Viewer" role (Read-only access)
# We give it 'Viewer' so it can see configs but NOT change or delete anything.
echo "🔐 Assigning 'Viewer' role to the Service Account..."
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:$SA_NAME@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/viewer"

echo "✅ Setup Complete! Your environment is ready for the Python Auditor."
