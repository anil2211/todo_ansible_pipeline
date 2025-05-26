resource "aws_cloudfront_distribution" "website" {
  enabled             = true
  is_ipv6_enabled     = true
  aliases             = []
  default_root_object = "index.html"
  price_class         = var.cloudfront_config.price_class

  origin {
    domain_name = var.cloudfront_config.bucket_domain_name
    origin_id   = "S3-${var.cloudfront_config.bucket_name}"

    s3_origin_config {
      origin_access_identity = var.cloudfront_config.origin_access_identity
    }
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-${var.cloudfront_config.bucket_name}"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
    minimum_protocol_version = "TLSv1.2_2021"
    ssl_support_method = "sni-only"
  }

  tags = {
    Name = "CloudFront Website Distribution"
  }
}
