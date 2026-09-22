locals {
  name_prefix = var.name_prefix != "" ? format("%s-", var.name_prefix) : ""
  name_suffix = var.name_suffix != "" ? format("-%s", var.name_suffix) : ""

  prefix_suffix_map = { for key, _ in var.synthetics_monitors : key => "${local.name_prefix}${key}${local.name_suffix}" }
}
