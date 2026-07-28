data "pagerduty_vendor" "vendor" {
  for_each = toset(var.pagerduty_vendors)
  name     = each.key
}

data "pagerduty_escalation_policy" "ep" {
  name = var.pagerduty_escalation_policy
}
