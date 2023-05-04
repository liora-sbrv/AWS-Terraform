  prefix = "liora-${var.bucket_name}"
}

resource "aws_s3_bucket" "Name" {
  bucket = "${local.prefix}-${var.bucket_name}"

  versioning {
    enabled = var.versioning
  }
  force_destroy = true
}

resource "aws_s3_bucket" "Name1" {
  bucket = "${local.prefix}-${var.bucket_name}-2"

  versioning {
    enabled = var.versioning
  }
  force_destroy = true
}


data "aws_region" "current" {}
