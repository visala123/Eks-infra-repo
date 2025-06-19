# Infrastructure as Code: EKS Deployment with Terraform and GitHub Actions

This repository provisions an Amazon EKS environment using Terraform. It automates VPC, EKS cluster, and ECR setup with CI/CD integration via GitHub Actions.

---

## 📁 Folder Structure

.
├── .github/workflows/
│ └── terraform.yml # GitHub Actions workflow for CI/CD
│
├── terraform/
│ ├── ecr.tf # Amazon Elastic Container Registry
│ ├── eks-cluster.tf # EKS cluster setup
│ ├── main.tf # Terraform entry point
│ ├── outputs.tf # Output variables
│ ├── terraform.tf # Backend config (e.g., remote state)
│ ├── variables.tf # Input variable definitions
│ └── vpc.tf # VPC and subnet configuration
│
└── .gitignore


---

## 🔐 Note

Before pushing the code to the `main` branch, update the repository secrets:

**GitHub → Settings → Secrets and variables → Actions → New repository secret**

Add the following:

- `AWS_ACCESS_KEY_ID` – your AWS access key ID  
- `AWS_SECRET_ACCESS_KEY` – your AWS secret key  
- `BUCKET_TF_STATE` – S3 bucket name for the Terraform state file  

---

## ❌ Destroy Infrastructure

To clean up all provisioned resources, run the following in your terminal:

```bash
cd terraform
terraform init        # if not already initialized
terraform destroy
⚠️ This will delete all AWS resources provisioned by this repository, including EKS, ECR, and VPC components.