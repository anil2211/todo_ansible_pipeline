# modules/cloudfront/variables.tf
variable "cloudfront_config" {
  type = object({
    bucket_name             = string
    bucket_domain_name      = string
    origin_access_identity  = string
    price_class             = string
    custom_domain           = string
    acm_certificate_arn     = string
  })
}


variable "environment" {
  type = string
}