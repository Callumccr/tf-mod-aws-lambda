# -----------------------------------------------------------------------------
# Variables: Common AWS Provider - Autoloaded from Terragrunt
# -----------------------------------------------------------------------------

variable "aws_region" {
  description = "The AWS region (e.g. ap-southeast-2). Autoloaded from region.tfvars."
  type        = string
  default     = ""
}

variable "aws_account_id" {
  description = "The AWS account id of the provider being deployed to (e.g. 12345678). Autoloaded from account.tfvars"
  type        = string
  default     = ""
}

variable "aws_assume_role_arn" {
  description = "(Optional) - ARN of the IAM role when optionally connecting to AWS via assumed role. Autoloaded from account.tfvars."
  type        = string
  default     = ""
}

variable "aws_assume_role_session_name" {
  description = "(Optional) - The session name to use when making the AssumeRole call."
  type        = string
  default     = ""
}

variable "aws_assume_role_external_id" {
  description = "(Optional) - The external ID to use when making the AssumeRole call."
  type        = string
  default     = ""
}

variable "availability_zones" {
  description = "(Required) - The AWS avaialbility zones (e.g. ap-southeast-2a/b/c). Autoloaded from region.tfvars."
  type        = list(string)
}

# -----------------------------------------------------------------------------
# Variables: TF-MOD-AWS-LAMBDA
# -----------------------------------------------------------------------------

variable "enabled" {
  description = "(Optional) -  A Switch that decides whether to create a terraform resource or run a provisioner. Default is true"
  type        = bool
  default     = true
}

variable "function_name" {
  type        = string
  description = "(Required) - A unique name for your Lambda Function."
}

variable "filename" {
  type        = string
  description = "(Optional) - The path to the function's deployment package within the local filesystem. If defined, The s3_-prefixed options cannot be used."
  default     = ""
}

variable "handler" {
  type        = string
  description = "(Required) - The function entrypoint in your code."
}

variable "role" {
  type        = string
  description = "(Required) - IAM role attached to the Lambda Function. This governs both who / what can invoke your Lambda Function, as well as what resources our Lambda Function has access to."
}

variable "description" {
  type        = string
  description = "(Optional) - Description of what your Lambda Function does."
  default     = ""
}

variable "layers" {
  type        = list(string)
  description = "(Optional) - List of Lambda Layer Version ARNs (maximum of 5) to attach to your Lambda Function. "
  default     = []
}

variable "memory_size" {
  type        = number
  description = "(Optional) - Amount of memory in MB your Lambda Function can use at runtime. Defaults to 128."
  default     = 128
}

variable "runtime" {
  type        = string
  description = "(Required) - See Lambda Runtimes for valid values"
}

variable "timeout" {
  type        = number
  description = "(Optional) - The amount of time your Lambda Function has to run in seconds. Defaults to 3"
  default     = 3
}

variable "reserved_concurrent_executions" {
  type        = number
  description = "(Optional) - The amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations. Defaults to Unreserved Concurrency Limits -1. "
  default     = null
}

variable "publish" {
  type        = bool
  description = "(Optional) - Whether to publish creation/change as new Lambda Function Version. Defaults to false."
  default     = false
}

variable "kms_key_arn" {
  type        = string
  description = "(Optional)  - Amazon Resource Name (ARN) of the AWS Key Management Service (KMS) key that is used to encrypt environment variables. If this configuration is not provided when environment variables are in use, AWS Lambda uses a default service key.."
  default     = ""
}

// dead_letter_config is a child block with a single argument:
variable "target_arn" {
  type        = list(string)
  description = "(Required) The ARN of an SNS topic or SQS queue to notify when an invocation fails. If this option is used, the function's IAM role must be granted suitable access to write to the target object, which means allowing either the sns:Publish or sqs:SendMessage action on this ARN, depending on which service is targeted."
  default     = []
}

// tracing_config is a child block with a single argument:
variable "mode" {
  type        = list(string)
  description = "(Optional) - Can be either PassThrough or Active. If PassThrough, Lambda will only trace the request from an upstream service if it contains a tracing header. If Active, Lambda will respect any tracing header it receives from an upstream service. If no tracing header is received, Lambda will call X-Ray for a tracing decision."
  default     = []
}

// vpc_config requires the following:
variable "subnet_ids" {
  description = "(Required) - A list of subnet IDs associated with the Lambda function."
  type        = list(string)
  default     = []
}


// Security group requires the following:

variable "vpc_id" {
  type        = string
  default     = ""
  description = "(Optional) - VPC ID"
}

variable "use_existing_security_groups" {
  type        = bool
  description = "(Optional) - Flag to enable/disable creation of Security Group in the module. Set to `true` to disable Security Group creation and provide a list of existing security Group IDs in `existing_security_groups` to place the Lambda function into"
  default     = false
}

variable "existing_security_groups" {
  type        = list(string)
  default     = []
  description = "(Optional) - List of existing Security Group IDs to place the Lambda function into. Set `use_existing_security_groups` to `true` to enable using `existing_security_groups` as Security Groups for the Lambda function"
}

variable "allowed_security_groups" {
  type        = list(string)
  default     = []
  description = "(Optional) - List of Security Group IDs that are allowed ingress to the Lambda function"
}

variable "allow_all_egress" {
  type        = bool
  description = "(Required) - Whether to allow egress to (0.0.0.0/0) from the the Lambda function"
  default     = true
}

variable "allowed_cidr_blocks" {
  type        = list(string)
  default     = []
  description = "(Optional) - List of CIDR blocks that are allowed ingress to the Lambda function"
}

variable "port" {
  type        = list(string)
  default     = []
  description = "(Optional) - Allow inbound traffic to internal CIDR ranges"
}


// For environment the following attributes are supported:
variable "environment_variables" {
  type        = map(string)
  default     = {}
  description = "(Optional) - A map that defines environment variables for the Lambda function."
}


// Lambda @ Edge
variable "lambda_at_edge" {
  description = "Set this to true if using Lambda@Edge, to enable publishing, limit the timeout, and allow edgelambda.amazonaws.com to invoke the function"
  type        = bool
  default     = false
}

# -----------------------------------------------------------------------------
# Variables: Role
# -----------------------------------------------------------------------------

variable "policy_arn" {
  type        = list(string)
  description = "(Optional) - The ARNs of the policies you want to attach to the Lambda functions role"
  default     = []
}


# -----------------------------------------------------------------------------
# Variables: Cloudwatch Log Group
# -----------------------------------------------------------------------------


variable "enable_cloudwatch_logs" {
  description = "(Optional) - Set this to false to disable logging your Lambda output to CloudWatch Logs"
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "(Optional) - The ARN of the KMS Key to use when encrypting log data."
  type        = string
  default     = ""
}

variable "retention_in_days" {
  description = "(Optional) - Lammbda Cloudwatch log group. Specifies the number of days you want to retain log events in the specified log group."
  type        = number
  default     = 30
}

# -----------------------------------------------------------------------------
# Variables: Cloudwatch Alarms
# -----------------------------------------------------------------------------

variable "enable_metric_alarms" {
  description = "(Optional) - Set this to false to disable Cloudwatch metric alarm functionality to your Lambda function"
  type        = bool
  default     = true
}

variable "comparison_operator" {
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand. Either of the following is supported: GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold."
  type        = string
}

variable "evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold."
  type        = number
}

variable "threshold" {
  description = "The value against which the specified statistic is compared."
  type        = number
}

variable "unit" {
  description = "The unit for the alarm's associated metric."
  type        = string
  default     = null
}

variable "metric_name" {
  description = "The name for the alarm's associated metric. See docs for supported metrics."
  type        = string
  default     = null
}

variable "cloudwatch_namespace" {
  description = "The namespace for the alarm's associated metric. See docs for the list of namespaces. See docs for supported metrics."
  type        = string
  default     = null
}

variable "period" {
  description = "The period in seconds over which the specified statistic is applied."
  type        = string
  default     = null
}

variable "statistic" {
  description = "The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum"
  type        = string
  default     = null
}

variable "actions_enabled" {
  description = "Indicates whether or not actions should be executed during any changes to the alarm's state. Defaults to false."
  type        = bool
  default     = false
}

variable "datapoints_to_alarm" {
  description = "The number of datapoints that must be breaching to trigger the alarm."
  type        = number
  default     = null
}

variable "dimensions" {
  description = "The dimensions for the alarm's associated metric."
  type        = any
  default     = null
}

variable "alarm_actions" {
  description = "The list of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN)."
  type        = list(string)
  default     = []
}

variable "insufficient_data_actions" {
  description = "The list of actions to execute when this alarm transitions into an INSUFFICIENT_DATA state from any other state. Each action is specified as an Amazon Resource Name (ARN)."
  type        = list(string)
  default     = []
}

variable "ok_actions" {
  description = "The list of actions to execute when this alarm transitions into an OK state from any other state. Each action is specified as an Amazon Resource Name (ARN)."
  type        = list(string)
  default     = []
}

variable "extended_statistic" {
  description = "The percentile statistic for the metric associated with the alarm. Specify a value between p0.0 and p100."
  type        = string
  default     = null
}

variable "treat_missing_data" {
  description = "Sets how this alarm is to handle missing data points. The following values are supported: missing, ignore, breaching and notBreaching."
  type        = string
  default     = "missing"
}

variable "evaluate_low_sample_count_percentiles" {
  description = "Used only for alarms based on percentiles. If you specify ignore, the alarm state will not change during periods with too few data points to be statistically significant. If you specify evaluate or omit this parameter, the alarm will always be evaluated and possibly change state no matter how many data points are available. The following values are supported: ignore, and evaluate."
  type        = string
  default     = null
}

variable "metric_query" {
  description = "Enables you to create an alarm based on a metric math expression. You may specify at most 20."
  type        = any
  default     = []
}

# -----------------------------------------------------------------------------
# Variables: TF-MOD-LABEL
# -----------------------------------------------------------------------------

variable "namespace" {
  type        = string
  default     = ""
  description = "(Optional) - Namespace, which could be your abbreviated product team, e.g. 'rci', 'mi', 'hp', or 'core'"
}

variable "environment" {
  type        = string
  default     = ""
  description = "(Optional) - Environment, e.g. 'dev', 'qa', 'staging', 'prod'"
}

variable "name" {
  type        = string
  default     = ""
  description = "(Optional) - Solution name, e.g. 'vault', 'consul', 'keycloak', 'k8s', or 'baseline'"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "(Optional) - Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes`"
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "(Optional) - Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "(Optional) - Additional tags"
}
