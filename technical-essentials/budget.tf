resource "aws_budgets_budget" "limit_amount" {
  name         = "learning_limit_budget"
  budget_type  = "COST"
  limit_amount = "50"
  limit_unit   = "USD"
  time_unit    = "MONTHLY"

  notification {
    comparison_operator = "GREATER_THAN"
    threshold           = 100
    threshold_type      = "PERCENTAGE"
    notification_type   = "FORECASTED"
    subscriber_email_addresses = [
      "sergio@oliva.health",
      "sergio.toro.castano@gmail.com"
    ]
  }
}
