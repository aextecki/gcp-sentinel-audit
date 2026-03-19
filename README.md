# gcp-sentinel-audit (ongoing construction)

gcp-sentinel-audit 🛡️☁️
Automated GCP Security Posture & Vulnerability Audit Framework | Automated Security Posture Management (ASPM) for Google Cloud

🚀 Mission
To provide an automated, lightweight security auditing framework that identifies high-impact misconfigurations in GCP environments. This tool is designed to be executed from a hardened Linux administrative host, ensuring the security of the auditing process itself.

📖 Overview
gcp-sentinel-audit is a specialized security tool designed to bridge the gap between Cloud Security and Hardened Linux Administration


Built by a Linux System Administrator with a focus on offensive security, this framework automates the detection of critical cloud misconfigurations that lead to SSRF and Identity Escalation.

Key Features

***Linux-Hardened Execution: Designed to run from a secured Ubuntu/CentOS environment.




🏗️ Architecture
The framework follows a dual-stage execution model:

Stage 1 (Bash)

setup_audit_env.sh – Automates API enablement and creates a restricted Service Account.
cleanup_audit_env.sh - Automate the clean up of all created resources quietly for zero cost.

Stage 2 (Python):

🛠️ Key Security Checks

***SSRF Mitigation: Identification of instances not enforcing IMDSv2.

***Data Exfiltration: Scanning for Cloud Storage buckets with allUsers permissions.

***Identity Governance: Auditing IAM roles for "Owner/Editor" over-privilege.

***Network Hardening: Detecting overly permissive Firewall rules (0.0.0.0/0).


____________________________________________________________________________________________________________________________________________________

📋 Portfolio 
This project demonstrates a synthesis of Linux System Administration and Cloud Security Engineering. It utilizes the Google Cloud SDK and Python to enforce security benchmarks similar to those found in the CIS GCP Foundation.
