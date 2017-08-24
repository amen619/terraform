provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "panda-terraform-state"
  versioning {
    enabled = true
  }
  lifecycle {
    prevent_destroy = true
  }

}

output "s3_bucket_arn" {
  value = "${aws_s3_bucket.terraform_state.arn}"
}
