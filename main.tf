resource "google_compute_forwarding_rule" "compute_forwarding_rules" {
  for_each = var.compute_forwarding_rules

  name                    = each.value.name
  all_ports               = each.value.all_ports
  allow_global_access     = each.value.allow_global_access
  allow_psc_global_access = each.value.allow_psc_global_access
  backend_service         = each.value.backend_service
  deletion_policy         = each.value.deletion_policy
  description             = each.value.description
  ip_address              = each.value.ip_address
  ip_collection           = each.value.ip_collection
  ip_protocol             = each.value.ip_protocol
  ip_version              = each.value.ip_version
  is_mirroring_collector  = each.value.is_mirroring_collector
  labels                  = each.value.labels
  load_balancing_scheme   = each.value.load_balancing_scheme
  network                 = each.value.network
  network_tier            = each.value.network_tier
  no_automate_dns_zone    = each.value.no_automate_dns_zone
  port_range              = each.value.port_range
  ports                   = each.value.ports
  project                 = each.value.project
  recreate_closed_psc     = each.value.recreate_closed_psc
  region                  = each.value.region
  service_label           = each.value.service_label
  source_ip_ranges        = each.value.source_ip_ranges
  subnetwork              = each.value.subnetwork
  target                  = each.value.target

  dynamic "service_directory_registrations" {
    for_each = each.value.service_directory_registrations != null ? [each.value.service_directory_registrations] : []
    content {
      namespace = service_directory_registrations.value.namespace
      service   = service_directory_registrations.value.service
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

