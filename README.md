## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4 |
| <a name="requirement_pagerduty"></a> [pagerduty](#requirement\_pagerduty) | >= 3.5 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_pagerduty"></a> [pagerduty](#provider\_pagerduty) | >= 3.5 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [pagerduty_service.critical](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service) | resource |
| [pagerduty_service.non_critical](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service) | resource |
| [pagerduty_service.synthetics_newrelic](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service) | resource |
| [pagerduty_service_integration.critical](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_integration) | resource |
| [pagerduty_service_integration.critical_events_API_v2](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_integration) | resource |
| [pagerduty_service_integration.non_critical](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_integration) | resource |
| [pagerduty_service_integration.non_critical_events_API_v2](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_integration) | resource |
| [pagerduty_service_integration.synthetics_newrelic](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_integration) | resource |
| [pagerduty_escalation_policy.ep](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/data-sources/escalation_policy) | data source |
| [pagerduty_vendor.vendor](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/data-sources/vendor) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Prefix to add to all resource names. | `string` | `""` | no |
| <a name="input_name_suffix"></a> [name\_suffix](#input\_name\_suffix) | Suffix to add to all resource names. | `string` | `""` | no |
| <a name="input_pagerduty_escalation_policy"></a> [pagerduty\_escalation\_policy](#input\_pagerduty\_escalation\_policy) | n/a | `string` | `"Default"` | no |
| <a name="input_pagerduty_services"></a> [pagerduty\_services](#input\_pagerduty\_services) | n/a | <pre>map(object({<br/>    name         = optional(string)<br/>    critical     = optional(bool, false)<br/>    non_critical = optional(bool, false)<br/>    vendor       = optional(string)<br/>    api          = optional(bool, false)<br/>  }))</pre> | <pre>{<br/>  "Alertmanager": {<br/>    "critical": true,<br/>    "non_critical": true,<br/>    "vendor": "Prometheus"<br/>},<br/>  "NewRelic": {<br/>    "critical": true,<br/>    "non_critical": true,<br/>    "vendor": "New Relic"<br/>  },<br/>  "OpenSearch": {<br/>    "api": true,<br/>    "non_critical": true<br/>  }<br/>}</pre> | no |
| <a name="input_pagerduty_vendors"></a> [pagerduty\_vendors](#input\_pagerduty\_vendors) | n/a | `list(string)` | <pre>[<br/>  "New Relic",<br/>  "Prometheus"<br/>]</pre> | no |
| <a name="input_synthetics_monitors"></a> [synthetics\_monitors](#input\_synthetics\_monitors) | n/a | <pre>map(object({<br/>    create_critical_monitor     = optional(bool, false)<br/>    create_non_critical_monitor = optional(bool, false)<br/>  }))</pre> | `{}` | no |

## Outputs

No outputs.