variable "pagerduty_escalation_policy" {
  type    = string
  default = "Default"
}

variable "pagerduty_services" {
  type = map(object({
    name         = optional(string)
    critical     = optional(bool, false)
    non_critical = optional(bool, false)
    vendor       = optional(string)
    api          = optional(bool, false)
  }))
  default = {
    "NewRelic" = {
      critical     = true,
      non_critical = true,
      vendor       = "New Relic"
    },
    "Alertmanager" = {
      critical     = true,
      non_critical = true,
      vendor       = "Prometheus"
    },
    "OpenSearch" = {
      non_critical = true,
      api          = true
    }
  }
}

variable "pagerduty_vendors" {
  type    = list(string)
  default = ["New Relic", "Prometheus"]
}

variable "newrelic_resource_name_prefix" {
  type    = string
  default = ""
}

variable "newrelic_resource_name_suffix" {
  type    = string
  default = ""
}

variable "synthetics_monitors" {
  type = map(object({
    create_critical_monitor     = optional(bool, false)
    create_non_critical_monitor = optional(bool, false)
  }))
  default = {}
}
