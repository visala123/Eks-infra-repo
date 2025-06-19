# Streamlining Kubernetes Deployments: CI/CD with GitHub Actions and Helm for EKS
# Infrastructure as Code: EKS Deployment with Terraform and GitHub Actions

This repository provisions an Amazon EKS environment using Terraform. It automates VPC, EKS cluster, and ECR setup with CI/CD integration via GitHub Actions.

---

## 📁 Folder Structure

\`\`\`
.
├── .github/workflows/
│   └── terraform.yml        # GitHub Actions workflow for CI/CD
│
├── terraform/
│   ├── ecr.tf               # Amazon Elastic Container Registry
│   ├── eks-cluster.tf       # EKS cluster setup
│   ├── main.tf              # Terraform entry point
│   ├── outputs.tf           # Output variables
│   ├── terraform.tf         # Backend config (e.g., remote state)
│   ├── variables.tf         # Input variable definitions
│   └── vpc.tf               # VPC and subnet configuration
│
└── .gitignore
\`\`\`

---`

Note:Before pushing the code to main branch update the secrects under settings->secrets and variables->Actions->secrets->New repository secrets
secrets.AWS_ACCESS_KEY_ID         #access key id
secrets.AWS_SECRET_ACCESS_KEY     #secret key 
secrets.BUCKET_TF_STATE           #bucket name for terraform state file
## ❌ Destroy Infrastructure

To clean up all provisioned resources, run:

\`\`\`bash or in the terminal
cd terraform
terraform init        # if not already initialized
terraform destroy
