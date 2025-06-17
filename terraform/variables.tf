variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-northeast-2"
}

variable "clusterName" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "eks-infra"
}

