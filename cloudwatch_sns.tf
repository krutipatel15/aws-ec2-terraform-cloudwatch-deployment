# cloudwatch_sns.tf
resource "aws_sns_topic" "alert_topic" {
  name = "ec2-alerts"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.alert_topic.arn
  protocol  = "email"
  endpoint  = var.sns_email  # Email for receiving alerts
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "HighCPUUtilization"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "75"
  alarm_actions       = [aws_sns_topic.alert_topic.arn]
  dimensions = {
    InstanceId = aws_instance.web.id
  }
}
