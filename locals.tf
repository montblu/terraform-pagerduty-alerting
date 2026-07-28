locals {
  nr_entity_prefix = var.newrelic_resource_name_prefix != "" ? format("%s-", var.newrelic_resource_name_prefix) : ""
  nr_entity_suffix = var.newrelic_resource_name_suffix != "" ? format("-%s", var.newrelic_resource_name_suffix) : ""

  prefix_suffix_map = { for key, _ in var.synthetics_monitors : key => "${local.nr_entity_prefix}${key}${local.nr_entity_suffix}" }
}
