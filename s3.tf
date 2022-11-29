resource "aws_s3_bucket" "workbucket" {
  bucket = "nallabirudu90"
  acl    = "private"

  tags = {
    Name        = "terraform bucket"
    Environment = "test"
  }

 depends_on = [
    aws_vpc.nallabirudu95,
  ]
}
