resource "aws_cloudwatch_metric_alarm" "cloudwatch_alarm" {
        alarm_name = var.alarm_config.alarm_name
        comparison_operator = var.alarm_config.comparison_operator
        evaluation_periods = var.alarm_config.evaluation_periods
        metric_name = var.alarm_config.metric_name
        namespace = var.alarm_config.namespace
        period = var.alarm_config.period
        statistic = var.alarm_config.statistic
        threshold = var.alarm_config.threshold
        alarm_description = var.alarm_config.alarm_description
        alarm_actions = var.alarm_config.alarm_actions
        dimensions = var.alarm_config.dimensions
  
}