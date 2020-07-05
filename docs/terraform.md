## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 >= 2.7.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| availability\_zones | (Required) - The AWS avaialbility zones (e.g. ap-southeast-2a/b/c). Autoloaded from region.tfvars. | `list(string)` | n/a | yes |
| cloudwatch\_namespace | The namespace for the alarm's associated metric. See docs for the list of namespaces. See docs for supported metrics. | `string` | n/a | yes |
| comparison\_operator | The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand. Either of the following is supported: GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold. | `string` | n/a | yes |
| datapoints\_to\_alarm | The number of datapoints that must be breaching to trigger the alarm. | `number` | n/a | yes |
| dimensions | The dimensions for the alarm's associated metric. | `any` | n/a | yes |
| evaluate\_low\_sample\_count\_percentiles | Used only for alarms based on percentiles. If you specify ignore, the alarm state will not change during periods with too few data points to be statistically significant. If you specify evaluate or omit this parameter, the alarm will always be evaluated and possibly change state no matter how many data points are available. The following values are supported: ignore, and evaluate. | `string` | n/a | yes |
| evaluation\_periods | The number of periods over which data is compared to the specified threshold. | `number` | n/a | yes |
| extended\_statistic | The percentile statistic for the metric associated with the alarm. Specify a value between p0.0 and p100. | `string` | n/a | yes |
| function\_name | (Required) - A unique name for your Lambda Function. | `string` | n/a | yes |
| handler | (Required) - The function entrypoint in your code. | `string` | n/a | yes |
| metric\_name | The name for the alarm's associated metric. See docs for supported metrics. | `string` | n/a | yes |
| period | The period in seconds over which the specified statistic is applied. | `string` | n/a | yes |
| reserved\_concurrent\_executions | (Optional) - The amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations. Defaults to Unreserved Concurrency Limits -1. | `number` | n/a | yes |
| role | (Required) - IAM role attached to the Lambda Function. This governs both who / what can invoke your Lambda Function, as well as what resources our Lambda Function has access to. | `string` | n/a | yes |
| runtime | (Required) - See Lambda Runtimes for valid values | `string` | n/a | yes |
| statistic | The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum | `string` | n/a | yes |
| threshold | The value against which the specified statistic is compared. | `number` | n/a | yes |
| unit | The unit for the alarm's associated metric. | `string` | n/a | yes |
| actions\_enabled | Indicates whether or not actions should be executed during any changes to the alarm's state. Defaults to false. | `bool` | `false` | no |
| alarm\_actions | The list of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN). | `list(string)` | `[]` | no |
| allow\_all\_egress | (Required) - Whether to allow egress to (0.0.0.0/0) from the the Lambda function | `bool` | `true` | no |
| allowed\_cidr\_blocks | (Optional) - List of CIDR blocks that are allowed ingress to the Lambda function | `list(string)` | `[]` | no |
| allowed\_security\_groups | (Optional) - List of Security Group IDs that are allowed ingress to the Lambda function | `list(string)` | `[]` | no |
| attributes | (Optional) - Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| aws\_account\_id | The AWS account id of the provider being deployed to (e.g. 12345678). Autoloaded from account.tfvars | `string` | `""` | no |
| aws\_assume\_role\_arn | (Optional) - ARN of the IAM role when optionally connecting to AWS via assumed role. Autoloaded from account.tfvars. | `string` | `""` | no |
| aws\_assume\_role\_external\_id | (Optional) - The external ID to use when making the AssumeRole call. | `string` | `""` | no |
| aws\_assume\_role\_session\_name | (Optional) - The session name to use when making the AssumeRole call. | `string` | `""` | no |
| aws\_region | The AWS region (e.g. ap-southeast-2). Autoloaded from region.tfvars. | `string` | `""` | no |
| delimiter | (Optional) - Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes` | `string` | `"-"` | no |
| description | (Optional) - Description of what your Lambda Function does. | `string` | `""` | no |
| enable\_cloudwatch\_logs | (Optional) - Set this to false to disable logging your Lambda output to CloudWatch Logs | `bool` | `true` | no |
| enable\_metric\_alarms | (Optional) - Set this to false to disable Cloudwatch metric alarm functionality to your Lambda function | `bool` | `true` | no |
| enabled | (Optional) -  A Switch that decides whether to create a terraform resource or run a provisioner. Default is true | `bool` | `true` | no |
| environment | (Optional) - Environment, e.g. 'dev', 'qa', 'staging', 'prod' | `string` | `""` | no |
| environment\_variables | (Optional) - A map that defines environment variables for the Lambda function. | `map(string)` | `{}` | no |
| existing\_security\_groups | (Optional) - List of existing Security Group IDs to place the Lambda function into. Set `use_existing_security_groups` to `true` to enable using `existing_security_groups` as Security Groups for the Lambda function | `list(string)` | `[]` | no |
| filename | (Optional) - The path to the function's deployment package within the local filesystem. If defined, The s3\_-prefixed options cannot be used. | `string` | `""` | no |
| insufficient\_data\_actions | The list of actions to execute when this alarm transitions into an INSUFFICIENT\_DATA state from any other state. Each action is specified as an Amazon Resource Name (ARN). | `list(string)` | `[]` | no |
| kms\_key\_arn | (Optional)  - Amazon Resource Name (ARN) of the AWS Key Management Service (KMS) key that is used to encrypt environment variables. If this configuration is not provided when environment variables are in use, AWS Lambda uses a default service key.. | `string` | `""` | no |
| kms\_key\_id | (Optional) - The ARN of the KMS Key to use when encrypting log data. | `string` | `""` | no |
| lambda\_at\_edge | Set this to true if using Lambda@Edge, to enable publishing, limit the timeout, and allow edgelambda.amazonaws.com to invoke the function | `bool` | `false` | no |
| layers | (Optional) - List of Lambda Layer Version ARNs (maximum of 5) to attach to your Lambda Function. | `list(string)` | `[]` | no |
| memory\_size | (Optional) - Amount of memory in MB your Lambda Function can use at runtime. Defaults to 128. | `number` | `128` | no |
| metric\_query | Enables you to create an alarm based on a metric math expression. You may specify at most 20. | `list` | `[]` | no |
| mode | (Optional) - Can be either PassThrough or Active. If PassThrough, Lambda will only trace the request from an upstream service if it contains a tracing header. If Active, Lambda will respect any tracing header it receives from an upstream service. If no tracing header is received, Lambda will call X-Ray for a tracing decision. | `list(string)` | `[]` | no |
| name | (Optional) - Solution name, e.g. 'vault', 'consul', 'keycloak', 'k8s', or 'baseline' | `string` | `""` | no |
| namespace | (Optional) - Namespace, which could be your abbreviated product team, e.g. 'rci', 'mi', 'hp', or 'core' | `string` | `""` | no |
| ok\_actions | The list of actions to execute when this alarm transitions into an OK state from any other state. Each action is specified as an Amazon Resource Name (ARN). | `list(string)` | `[]` | no |
| policy\_arn | (Optional) - The ARNs of the policies you want to attach to the Lambda functions role | `list(string)` | `[]` | no |
| port | (Optional) - Allow inbound traffic to internal CIDR ranges | `list(string)` | `[]` | no |
| publish | (Optional) - Whether to publish creation/change as new Lambda Function Version. Defaults to false. | `bool` | `false` | no |
| retention\_in\_days | (Optional) - Lammbda Cloudwatch log group. Specifies the number of days you want to retain log events in the specified log group. | `number` | `30` | no |
| subnet\_ids | (Required) - A list of subnet IDs associated with the Lambda function. | `list(string)` | `[]` | no |
| tags | (Optional) - Additional tags | `map(string)` | `{}` | no |
| target\_arn | (Required) The ARN of an SNS topic or SQS queue to notify when an invocation fails. If this option is used, the function's IAM role must be granted suitable access to write to the target object, which means allowing either the sns:Publish or sqs:SendMessage action on this ARN, depending on which service is targeted. | `list(string)` | `[]` | no |
| timeout | (Optional) - The amount of time your Lambda Function has to run in seconds. Defaults to 3 | `number` | `3` | no |
| treat\_missing\_data | Sets how this alarm is to handle missing data points. The following values are supported: missing, ignore, breaching and notBreaching. | `string` | `"missing"` | no |
| use\_existing\_security\_groups | (Optional) - Flag to enable/disable creation of Security Group in the module. Set to `true` to disable Security Group creation and provide a list of existing security Group IDs in `existing_security_groups` to place the Lambda function into | `bool` | `false` | no |
| vpc\_enabled | (Optional) Provide this to allow your function to access your VPC. Default is false | `bool` | `false` | no |
| vpc\_id | (Optional) - VPC ID | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| cloudwatch\_metric\_alarm\_arn | The ARN of the Cloudwatch metric alarm. |
| cloudwatch\_metric\_alarm\_id | The ID of the Cloudwatch metric alarm. |
| lambda\_arn | The ARN of the Lambda function |
| lambda\_ids | The name of the VPC Lambda functions |
| log\_group\_arn | The Amazon Resource Name (ARN) specifying the log group. |
| role\_arn | The ARN of the IAM role created for the Lambda function |
| role\_name | The name of the IAM role created for the Lambda function |
| security\_group\_id | Security Group ID |

