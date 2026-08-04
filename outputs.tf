# Local addition (not in upstream): expose the New Relic vendor integration keys
# so the newrelic-monitoring module can route alerts to these PagerDuty services
# in a single apply. Upstream has no outputs. See VENDORED.md.
#
# Only the vendor-integration services (api = false) carry an integration_key
# here; API/Events-v2 services (e.g. OpenSearch) are intentionally excluded.

output "critical_services" {
  description = "Critical PagerDuty services keyed by service key, with their vendor integration key."
  sensitive   = true
  value = {
    for k, integ in pagerduty_service_integration.critical :
    k => {
      name            = pagerduty_service.critical[k].name
      integration_key = integ.integration_key
    }
  }
}

output "non_critical_services" {
  description = "Non-critical PagerDuty services keyed by service key, with their vendor integration key."
  sensitive   = true
  value = {
    for k, integ in pagerduty_service_integration.non_critical :
    k => {
      name            = pagerduty_service.non_critical[k].name
      integration_key = integ.integration_key
    }
  }
}

output "synthetics_services" {
  description = "Synthetics NewRelic PagerDuty services keyed by monitor key, with integration key."
  sensitive   = true
  value = {
    for k, integ in pagerduty_service_integration.synthetics_newrelic :
    k => {
      name            = pagerduty_service.synthetics_newrelic[k].name
      integration_key = integ.integration_key
    }
  }
}
