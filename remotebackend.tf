terraform {
    backend "s3" {
        bucket = "nallabirudu97"
        key = "terraform.tfstate"
        region = "us-east-1"
    }
}