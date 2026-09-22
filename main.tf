##########################

# Pagerduty Synthetics resources

##########################

resource "pagerduty_service" "synthetics_newrelic" {
  for_each = { for key, value in var.synthetics_monitors : key => value if value.create_non_critical_monitor || value.create_critical_monitor }

  name                    = "NewRelic-synthetics-${local.prefix_suffix_map[each.key]}"
  auto_resolve_timeout    = "null"
  acknowledgement_timeout = 600
  escalation_policy       = data.pagerduty_escalation_policy.ep.id
  alert_creation          = "create_alerts_and_incidents"

  incident_urgency_rule {
    type    = "constant"
    urgency = lookup(each.value, "create_critical_monitor", false) ? "high" : "low"
  }
}

resource "pagerduty_service_integration" "synthetics_newrelic" {
  for_each = { for key, value in var.synthetics_monitors : key => value if value.create_non_critical_monitor || value.create_critical_monitor }

  name    = data.pagerduty_vendor.vendor["New Relic"].name
  service = pagerduty_service.synthetics_newrelic[each.key].id
  vendor  = data.pagerduty_vendor.vendor["New Relic"].id
}

##########################

# Pagerduty Resources

##########################

resource "pagerduty_service" "critical" {

  for_each = {
    for key, value in var.pagerduty_services : key => value
    if lookup(value, "critical", false)
  }

  name                    = "${local.name_prefix}${each.key}${local.name_suffix}-Critical"
  auto_resolve_timeout    = "null"
  acknowledgement_timeout = 600
  escalation_policy       = data.pagerduty_escalation_policy.ep.id
  alert_creation          = "create_alerts_and_incidents"

  incident_urgency_rule {
    type    = "constant"
    urgency = "high"
  }
}

resource "pagerduty_service_integration" "critical" {

  for_each = {
    for key, value in var.pagerduty_services : key => value
    if lookup(value, "critical", false) && !lookup(value, "api", false)
  }

  name    = data.pagerduty_vendor.vendor[each.value.vendor].name
  service = pagerduty_service.critical[each.key].id
  vendor  = data.pagerduty_vendor.vendor[each.value.vendor].id
}

resource "pagerduty_service" "non_critical" {

  for_each = {
    for key, value in var.pagerduty_services : key => value
    if lookup(value, "non_critical", false)
  }

  name                    = "${local.name_prefix}${each.key}${local.name_suffix}-Non_Critical"
  auto_resolve_timeout    = "null"
  acknowledgement_timeout = 600
  escalation_policy       = data.pagerduty_escalation_policy.ep.id
  alert_creation          = "create_alerts_and_incidents"

  incident_urgency_rule {
    type    = "constant"
    urgency = "low"
  }
}

resource "pagerduty_service_integration" "non_critical" {

  for_each = {
    for key, value in var.pagerduty_services : key => value
    if lookup(value, "non_critical", false) && !lookup(value, "api", false)
  }

  name    = data.pagerduty_vendor.vendor[each.value.vendor].name
  service = pagerduty_service.non_critical[each.key].id
  vendor  = data.pagerduty_vendor.vendor[each.value.vendor].id
}

resource "pagerduty_service_integration" "non_critical_events_API_v2" {

  for_each = {
    for key, value in var.pagerduty_services : key => value
    if lookup(value, "non_critical", false) && lookup(value, "api", false)
  }

  name    = "Events API V2"
  service = pagerduty_service.non_critical[each.key].id
  type    = "events_api_v2_inbound_integration"
}

resource "pagerduty_service_integration" "critical_events_API_v2" {

  for_each = {
    for key, value in var.pagerduty_services : key => value
    if lookup(value, "critical", false) && lookup(value, "api", false)
  }

  name    = "Events API V2"
  service = pagerduty_service.critical[each.key].id
  type    = "events_api_v2_inbound_integration"
}
