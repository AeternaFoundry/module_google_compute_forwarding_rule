variable "compute_forwarding_rules" {
  description = <<EOT
Map of compute_forwarding_rules, attributes below
Required:
    - name
Optional:
    - all_ports
    - allow_global_access
    - allow_psc_global_access
    - backend_service
    - deletion_policy
    - description
    - ip_address
    - ip_collection
    - ip_protocol
    - ip_version
    - is_mirroring_collector
    - labels
    - load_balancing_scheme
    - network
    - network_tier
    - no_automate_dns_zone
    - port_range
    - ports
    - project
    - recreate_closed_psc
    - region
    - service_label
    - source_ip_ranges
    - subnetwork
    - target
    - service_directory_registrations (block):
        - namespace (optional)
        - service (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    name                    = string
    all_ports               = optional(bool)
    allow_global_access     = optional(bool)
    allow_psc_global_access = optional(bool)
    backend_service         = optional(string)
    deletion_policy         = optional(string)
    description             = optional(string)
    ip_address              = optional(string)
    ip_collection           = optional(string)
    ip_protocol             = optional(string)
    ip_version              = optional(string)
    is_mirroring_collector  = optional(bool)
    labels                  = optional(map(string))
    load_balancing_scheme   = optional(string)
    network                 = optional(string)
    network_tier            = optional(string)
    no_automate_dns_zone    = optional(bool)
    port_range              = optional(string)
    ports                   = optional(set(string))
    project                 = optional(string)
    recreate_closed_psc     = optional(bool)
    region                  = optional(string)
    service_label           = optional(string)
    source_ip_ranges        = optional(list(string))
    subnetwork              = optional(string)
    target                  = optional(string)
    service_directory_registrations = optional(object({
      namespace = optional(string)
      service   = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 5 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

