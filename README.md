# terraform-gcp-adscert-callsign

This repo contains a Module to deploy ads.cert Call Sign domain DNS records to
Google Cloud DNS within a specified Managed Zone configuration.  The Module
will read a list of required DNS records from a JSON file exported by ads.cert
open source software tooling and transform those entries into records pushed
to Google Cloud DNS.