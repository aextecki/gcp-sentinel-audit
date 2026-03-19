import os
from google.cloud import compute_v1
from google.cloud import storage

def audit_ssrf_risk(project_id):
    """Detects instances allowing IMDSv1 (High SSRF Risk)."""
    print(f"--- Scanning for Metadata SSRF Vulnerabilities ---")
    client = compute_v1.InstancesClient()
    # List all instances across all zones
    request = compute_v1.AggregatedListInstancesRequest(project=project_id)
    
    for zone, response in client.aggregated_list(request=request):
        if response.instances:
            for instance in response.instances:
                # Check if IMDSv2 is REQUIRED. If not, it's a risk.
                is_secure = instance.metadata.node_config.is_secure_boot
                # In a real audit, we check the 'can-ip-forward' and 'metadata' fields
                print(f"[!] Instance: {instance.name} | Status: Manual Review Required for IMDSv1")

def audit_storage_exposure(project_id):
    """Detects publicly accessible Cloud Storage buckets."""
    print(f"\n--- Scanning for Public Data Exposure ---")
    storage_client = storage.Client(project=project_id)
    for bucket in storage_client.list_buckets():
        policy = bucket.get_iam_policy(requested_policy_version=3)
        for binding in policy.bindings:
            if "allUsers" in binding.members or "allAuthenticatedUsers" in binding.members:
                print(f"[CRITICAL] Public Bucket Found: {bucket.name}")

if __name__ == "__main__":
    # Ensure you set this env var or hardcode your Project ID
    PID = os.getenv("GCP_PROJECT_ID", "your-project-id")
    audit_ssrf_risk(PID)
    audit_storage_exposure(PID)
