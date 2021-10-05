/* This file manages S3 bucket and IAM users
   For simplicity all common global resources have been added here, these can be further improved using modules similar to VPC setup.

   Resources
   - S3 bucket : fake-product-assets
   - IAM users : emma and liam with admin access ; fake-product user with read/write to S3 bucket access
*/

provider "aws" {
  region = var.aws_region
}

### S3 bucket ###

resource "aws_s3_bucket" "fake-product-assets" {
  bucket_prefix = "fake-product-assets-"
  acl    = "private"

  tags = {
    Name        = "fake-product-assets"
    Environment = "Staging"
  }
}

### Admin IAM users and thier policies ###

resource "aws_iam_user" "emma" {
  name = "emma"
}

resource "aws_iam_user" "liam" {
  name = "liam"
}

resource "aws_iam_user_policy_attachment" "emma-policy" {
  user       = aws_iam_user.emma.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_user_policy_attachment" "liam-policy" {
  user       = aws_iam_user.liam.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

### System User with S3 access policy ###

resource "aws_iam_user" "systemuser-fake-product" {
  name = "fake-product"
}

resource "random_string" "random" {
  length           = 16
  special          = true
  override_special = "/@£$"
}

resource "aws_iam_policy" "s3policy" {
  name        = "s3-policy"
  path        = "/"
  description = "S3 policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]
        Effect   = "Allow"
        Resource = "${aws_s3_bucket.fake-product-assets.arn}"
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "s3-policy-attach" {
  name       = "s3-policy-attach"
  users      = [aws_iam_user.systemuser-fake-product.name]
  policy_arn = aws_iam_policy.s3policy.arn
}


