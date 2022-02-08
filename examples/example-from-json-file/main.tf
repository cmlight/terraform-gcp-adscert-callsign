terraform {
  required_version = ">= 0.12"
}

module "adscert_dns_for_signer_tk" {
  # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the module"
  source = "../../"

  project_id                  = var.project_id
  dns_managed_zone_name       = "dns-zone-signer-tk"
  call_sign_domain_and_folder = "_adscert.signer.tk"

  dns_publication_list_data = jsondecode(file("../sample_dns_publication_list.json"))
}

module "adscert_dns_for_verifier_tk" {
  # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the module"
  source = "../../"

  project_id                  = var.project_id
  dns_managed_zone_name       = "dns-zone-verifier-tk"
  call_sign_domain_and_folder = "_adscert.verifier.tk"

  dns_publication_list_data = jsondecode(file("../sample_dns_publication_list.json"))
}
