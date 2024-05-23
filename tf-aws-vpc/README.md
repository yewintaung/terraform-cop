# Terraform AWS backend type as S3

> [!NOTE]
> AWS Provider using s3 as backend statefile type. <br>
> Statefile will be stored in s3 bucket. <br>
> DynamoDB is used for locking.
```
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.50.0"
    }
  }

  backend "s3" {
    bucket         	    = "tf-aws-vpc-backend-statefile"      // s3 bucket name
    key              	  = "terraform/state/terraform.tfstate" // path of the S3 bucket
    region         	    = "ap-southeast-1"
    encrypt        	    = true
    dynamodb_table      = "tf-aws-vpc-backend-statefile-lock"  // dynamoDB name
  }
}
```
