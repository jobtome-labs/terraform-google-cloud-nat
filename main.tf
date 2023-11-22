resource "google_compute_router" "router" {
  provider = google

  name = var.name

  region = var.region

  network = var.network

  bgp {
    asn                = 64514
    keepalive_interval = var.bgp_keepalive_interval
  }
}

resource "google_compute_address" "address" {
  count = var.address_count

  provider = google

  name = "${var.name}-nat-address-${count.index}"

  region = var.region
}

resource "google_compute_router_nat" "router-nat" {
  provider = google

  name = "${var.name}-nat"

  region = var.region

  router = google_compute_router.router.name

  nat_ip_allocate_option = "MANUAL_ONLY"
  nat_ips                = google_compute_address.address.*.self_link

  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat

  enable_endpoint_independent_mapping = var.enable_endpoint_independent_mapping

  min_ports_per_vm = var.min_ports_per_vm
  max_ports_per_vm = var.max_ports_per_vm

  tcp_established_idle_timeout_sec = var.tcp_established_idle_timeout_sec
  tcp_transitory_idle_timeout_sec  = var.tcp_transitory_idle_timeout_sec
  udp_idle_timeout_sec             = var.udp_idle_timeout_sec
  icmp_idle_timeout_sec            = var.icmp_idle_timeout_sec

  dynamic "subnetwork" {
    for_each = var.source_subnetwork_ip_ranges_to_nat == "LIST_OF_SUBNETWORKS" ? { list_of_subnetworks = true } : {}

    content {
      name = var.subnetwork
      source_ip_ranges_to_nat = [
        "ALL_IP_RANGES"
      ]
    }
  }

  log_config {
    enable = var.enable_error_log
    filter = "ERRORS_ONLY"
  }
}
