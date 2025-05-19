variable "bucket_name" {
  description = "El nombre del bucket S3"
  type        = string
  default     = "bucket-gmricardo03"
}

variable "environment" {
  description = "Ambiente (Dev, Test, Prod)"
  type        = string
  default     = "Dev"
}
