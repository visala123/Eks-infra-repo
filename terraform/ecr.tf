resource "aws_ecr_repository" "eks-app-repo" {
  name                 = "eks-app-repo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Environment = "dev"
   
  }
}

