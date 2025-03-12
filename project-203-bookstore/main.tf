terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.90.1"
    }
    github = {
      source = "integrations/github"
      version = "6.6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"# Configuration options
}


provider "github" {
  token = var.git-token# Configuration options
}

variable "git-token" {
  default = "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"
}

variable "git-name" {
  default = "AydinTokuslu"
}

variable "key-name" {
  default = "mykey"
}

resource "github_repository" "myrepo" {
  name        = "bookstore-api-repo"
  visibility = "private"
  auto_init = true

}

resource "github_branch_default" "main" {
  repository = github_repository.myrepo.name
  branch     = "main"
}

variable "files" {
  default = ["bookstore-api.py", "Dockerfile", "requirements.txt", "docker-compose.yml"]
}

resource "github_repository_file" "app-files" {
  for_each = toset(var.files)
  content             = file(each.value)
  file                = each.value
  repository          = github_repository.myrepo.name
  branch              = "main"
  commit_message = "managed by Terraform"
  overwrite_on_create = true
}

resource "aws_security_group" "tf-docker-sec-grp" {
  name        = "docker-sec-grp-203"
  description = "enable SSH-HTTP for bookstore project"

  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow all ip and ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "docker-sec-grp-203"
  }
}

resource "aws_instance" "tf-docker-ec2" {
  ami                     = "ami-0b72821e2f351e396"
  instance_type               = "t2.micro"
  key_name                    = var.key-name
  vpc_security_group_ids      = [aws_security_group.tf-docker-sec-grp.id]
  user_data                   = templatefile("userdata.sh", { user-data-git-token = var.git-token, user-data-git-name = var.git-name })
  depends_on = [github_repository.myrepo, github_repository_file.app-files]
  tags = {
    Name = "webserver of Bookstore"
  }
  
}

output "website" {
  value = "http://${aws_instance.tf-docker-ec2.public_dns}"
}