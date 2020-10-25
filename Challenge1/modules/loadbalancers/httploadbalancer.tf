resource "google_compute_global_address" "default" {
  project      = var.project_id
  name         = "${var.name}-address"
  ip_version   = "IPV4"
  address_type = "EXTERNAL"
}

resource "google_compute_target_http_proxy" "http" {
  count   = var.enable_http ? 1 : 0
  project = var.project_id
  name    = "${var.name}-http-proxy"
  url_map = var.url_map
}

resource "google_compute_global_forwarding_rule" "http" {
  provider   = google-beta
  count      = var.enable_http ? 1 : 0
  project    = var.project_id
  name       = "${var.name}-http-rule"
  target     = google_compute_target_http_proxy.http[0].self_link
  ip_address = google_compute_global_address.default.address
  port_range = var.http_port

  depends_on = [google_compute_global_address.default]

  labels = var.elb_custom_labels
}

resource "google_compute_global_forwarding_rule" "https" {
  provider   = google-beta
  project    = var.project_id
  count      = var.enable_ssl ? 1 : 0
  name       = "${var.name}-https-rule"
  target     = google_compute_target_https_proxy.default[0].self_link
  ip_address = google_compute_global_address.default.address
  port_range = var.https_port
  depends_on = [google_compute_global_address.default]

  labels = var.elb_custom_labels
}

resource "google_compute_target_https_proxy" "default" {
  project = var.project_id
  count   = var.enable_ssl ? 1 : 0
  name    = "${var.name}-https-proxy"
  url_map = var.url_map

  ssl_certificates = var.ssl_certificates
}