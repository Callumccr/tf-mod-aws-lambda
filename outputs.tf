# -----------------------------------------------------------------------------
# Outputs: TF-MOD-AWS-LAMBDA
# -----------------------------------------------------------------------------

output "lambda_arn" {
  description = "The ARN of the Lambda function"
  value       = aws_lambda_function.default.*.arn
}

output "lambda_ids" {
  description = "The name of the VPC Lambda functions"
  value       = aws_lambda_function.default.*.function_name
}

output "role_arn" {
  description = "The ARN of the IAM role created for the Lambda function"
  value       = aws_iam_role.default.*.arn
}

output "role_name" {
  description = "The name of the IAM role created for the Lambda function"
  value       = aws_iam_role.default.*.name
}

output "security_group_id" {
  value       = aws_security_group.default.*.id
  description = "Security Group ID"
}

output "log_group_arn" {
  value       = aws_cloudwatch_log_group.default.*.arn
  description = "The Amazon Resource Name (ARN) specifying the log group."
}

# -----------------------------------------------------------------------------
# Outputs: Cloudwatch Alarms
# -----------------------------------------------------------------------------

output "cloudwatch_metric_alarm_arn" {
  description = "The ARN of the Cloudwatch metric alarm."
  value       = element(concat(aws_cloudwatch_metric_alarm.default.*.arn, [""]), 0)
}

output "cloudwatch_metric_alarm_id" {
  description = "The ID of the Cloudwatch metric alarm."
  value       = element(concat(aws_cloudwatch_metric_alarm.default.*.id, [""]), 0)
}
