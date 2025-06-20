# Streamlining Kubernetes Deployments: CI/CD with GitHub Actions and Helm for EKS

This repository provisions an Amazon EKS environment using Terraform. It automates VPC, EKS cluster, and ECR setup with CI/CD integration via GitHub Actions.

---

##  Folder Structure

![Folder Structure](https://github.com/visala123/Eks-infra-repo/blob/b389999ebce59ba2c72ffc12b2d12e628ebe9cfc/folder-structure.png)


---

##  Note
Create S3 bucket in aws console manually and update the name in backend S3 script and in the secrets. 

Before pushing the code to the `main` branch, update the repository secrets:

**GitHub → Settings → Secrets and variables → Actions → New repository secret**

Add the following:

- `AWS_ACCESS_KEY_ID` – your AWS access key ID  
- `AWS_SECRET_ACCESS_KEY` – your AWS secret key  
- `BUCKET_TF_STATE` – S3 bucket name for the Terraform state file  

---
## 🔄 CI/CD Workflow Overview

This project uses **GitHub Actions** to provision infrastructure and configure Amazon EKS using Terraform. It also sets up Argo CD automatically.

###  Trigger Conditions
This workflow is triggered:
- On push to `main` or `stage` branches
- On pull request to `main` (if files inside `terraform/` are changed)

###  Job 1: `terraform` – Provision EKS Infrastructure

- Initializes Terraform and remote backend (S3)
- Validates, formats, and creates Terraform plans
- Applies infrastructure changes on the `main` branch
- Configures AWS and updates kubeconfig for EKS
- Deploys NGINX Ingress Controller to the cluster

###  Job 2: `install_argocd` – Deploy Argo CD to EKS

- Authenticates with AWS and updates kubeconfig
- Deploys Argo CD using the official manifest
- Waits for Argo CD server to be ready
- Exposes Argo CD via a `LoadBalancer` service
- Outputs the LoadBalancer DNS of the Argo CD UI

You can access the Argo CD UI using the DNS printed in the last step.
OR else
Run the following command in the git bash<br>
kubectl get svc argocd-server -n argocd <br>
copy the loadbalancer and expose it <br>
user---admin <br>
For password run the following command <br>
kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 --decode


##  Destroy Infrastructure
Before terraform destroy you just remove the loadbalancer which was created by Nginix ingresscontroller and image which is in ECR.
To clean up all provisioned resources, run the following in your terminal:

```bash
cd terraform
terraform init        # if not already initialized
terraform destroy
⚠️ This will delete all AWS resources provisioned by this repository, including EKS, ECR, and VPC components.
