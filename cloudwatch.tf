// Cloudwatch log group
resource "aws_cloudwatch_log_group" "default" {
  count             = var.enabled == true && var.enable_cloudwatch_logs == true ? 1 : 0
  name              = "/aws/lambda/${var.function_name}"
  retention_in_days = var.retention_in_days
  kms_key_id        = var.kms_key_arn != null ? var.kms_key_arn : null
  tags              = module.log_label.tags
}

resource "aws_cloudwatch_metric_alarm" "default" {
  count = var.enabled == true && var.enable_metric_alarms == true ? 1 : 0

  alarm_name        = module.alarm_label.id
  alarm_description = var.description

  //alarm actions
  actions_enabled           = var.actions_enabled
  alarm_actions             = var.alarm_actions
  ok_actions                = var.ok_actions
  insufficient_data_actions = var.insufficient_data_actions

  //general alarm settings
  comparison_operator                   = var.comparison_operator
  evaluation_periods                    = var.evaluation_periods
  threshold                             = var.threshold
  datapoints_to_alarm                   = var.datapoints_to_alarm
  treat_missing_data                    = var.treat_missing_data
  evaluate_low_sample_count_percentiles = var.evaluate_low_sample_count_percentiles

  # conflicts with metric_query
  # metric_name        = var.metric_name
  # namespace          = var.cloudwatch_namespace
  # period             = var.period
  # statistic          = var.statistic
  # extended_statistic = var.extended_statistic
  # dimensions = var.dimensions

  # conflicts with metric_name
  dynamic "metric_query" {
    for_each = var.metric_query
    content {
      id          = lookup(metric_query.value, "id")
      label       = lookup(metric_query.value, "label", null)
      return_data = lookup(metric_query.value, "return_data", null)
      expression  = lookup(metric_query.value, "expression", null)

      dynamic "metric" {
        for_each = lookup(metric_query.value, "metric", [])
        content {
          metric_name = lookup(metric.value, "metric_name")
          namespace   = lookup(metric.value, "namespace")
          period      = lookup(metric.value, "period")
          stat        = lookup(metric.value, "stat")
          unit        = lookup(metric.value, "unit", null)
          dimensions  = lookup(metric.value, "dimensions", null)
        }
      }
    }
  }

  tags = module.alarm_label.tags
}
