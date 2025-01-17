terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.66.0"

    }     
}

  backend "s3" {
   bucket = "81s-remote-state"
   key    ="for_each-demo"
   region = "us-east-1"
   dynamodb_table = "81-locking"
 }

}

provider "aws" {
   # configuration option
   region = "us-east-1"
} 