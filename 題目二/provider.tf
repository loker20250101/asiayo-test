terraform {
  backend "s3" {
    bucket = "asia-yo-test-20250104"
	key = "eks-project"
	region = "ap-southeast-1"
  }
}

provider "aws" {
  profile = "asia-yo"
}