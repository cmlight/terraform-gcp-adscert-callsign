locals {
  # Creates a map from the fully-qualified key for the DNS record to the object
  # Example: mapped_dns_data["_delivery._adscert.signer.tk./TXT"] = (details)
  mapped_dns_data = {
    for index, value in var.dns_publication_list_data.dns_entries :
    "${value.dns_record_key_fully_qualified_domain_with_dot}/${value.dns_record_type}" => value
    if value.call_sign_domain_and_folder == var.call_sign_domain_and_folder        
  }
}

resource "google_dns_record_set" "adscert_dns_records" {
  for_each     = local.mapped_dns_data
  managed_zone = var.dns_managed_zone_name
  name         = each.value.dns_record_key_fully_qualified_domain_with_dot
  type         = each.value.dns_record_type
  ttl          = each.value.dns_record_ttl_seconds

  // Google Cloud DNS requires values containing spaces to be enclosed in quotes.
  rrdatas      = [for s in each.value.dns_record_values : (length(try(regex(" ", s), "")) == 0 ? s : "\"${s}\"")]

  project = var.project_id
}
