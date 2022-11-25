resource "aws_s3_bucket" "statebucket" {
  bucket = "nallabirudu97"
  acl    = "private"

  tags = {
    Name        = "terraform bucket"
    Environment = "test"
  }

 depends_on = [
    aws_vpc.nallabirudu95,
  ]
}


resource "aws_flow_log" "vpcflowlogs" {
  log_destination      = aws_s3_bucket.statebucket.arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = aws_vpc.nallabirudu95.id
}
