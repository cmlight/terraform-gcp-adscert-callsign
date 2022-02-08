variable "project_id" {
  type        = string
  description = "The Google Cloud Platform project ID containing the target DNS zone."
}

variable "dns_managed_zone_name" {
  type        = string
  description = "The zone name used to programmatically access the target DNS zone."
}

variable "call_sign_domain_and_folder" {
  type        = string
  description = "The ads.cert call sign domain and subdomain receiving the DNS entries. This will typically be in the form \"_adscert.example.com\" but can accept different subdomain values for configurations to test/staging environments."
}

variable "dns_publication_list_data" {
  type = object({
    dns_entries = list(object({
      call_sign_domain                               = string,
      call_sign_domain_and_folder                    = string,
      adscert_folder_component                       = string,
      adscert_record_component                       = string,
      dns_record_type                                = string,
      dns_record_ttl_seconds                         = number,
      dns_record_key_fully_qualified_domain          = string,
      dns_record_key_fully_qualified_domain_with_dot = string,
      dns_record_key_under_callsign_domain           = string,
      dns_record_key_under_adscert_folder            = string,
      dns_record_values                              = list(string)
    }))
  })
  description = "The DNS records to publish. This data should not be edited by hand: refer to the ads.cert open source software documentation for deriving the DNS publication list data from the ads.cert keyring which is written out in JSON format. Parse the file content usign an expression such as jsondecode(file(\"/path/to/dns_publication_list.json\")) before passing to this parameter."
}
