# gcp-sentinel-audit (ongoing construction)

gcp-sentinel-audit 🛡️☁️
Automated GCP Security Posture & Vulnerability Audit Framework

📖 Overview
gcp-sentinel-audit is a specialized security tool designed to bridge the gap between Cloud Security and Hardened Linux Administration


Built by a Linux System Administrator with a focus on offensive security, this framework automates the detection of critical cloud misconfigurations that lead to SSRF and Identity Escalation.

Key Features

**Linux-Hardened Execution: Designed to run from a secured Ubuntu/CentOS environment.




🏗️ Architecture
The framework follows a dual-stage execution model:

Stage 1 (Bash): setup_audit_env.sh – Automates API enablement and creates a restricted Service Account.

Stage 2 (Python):
