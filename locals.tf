locals {
  publish = var.lambda_at_edge ? true : var.publish
  timeout = var.lambda_at_edge ? min(var.timeout, 5) : var.timeout
}