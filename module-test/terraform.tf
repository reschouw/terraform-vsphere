terraform {
  backend "s3" {
    bucket = "getyourownbucket"
    key    = "getyourownkey"
    region = "us-west-2"
  }
}
