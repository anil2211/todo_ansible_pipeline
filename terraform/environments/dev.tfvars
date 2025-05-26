environment = "dev"
aws_region = "ap-south-1"
cloudfront_config = {
  bucket_name                 = "anil-todo-test-ui"
  custom_domain               = "test.intellihelper.tech"
  acm_certificate_arn        = "arn:aws:acm:ap-south-1:123"
  price_class                 = "PriceClass_100"
  bucket_domain_name          = "anil-todo-test-ui.s3.ap-south-1.amazonaws.com"  # Example value
  origin_access_identity_path = "origin-access-identity/cloudfront/EXAMPLE123"   # Example value
}
