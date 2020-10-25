resource "google_compute_url_map" "urlmap" {
  project = var.project_id

  name        = "${var.name}-url-map"
  description = "URL map for ${var.name}"

  default_service = google_compute_backend_service.api.self_link

  host_rule {
    hosts        = ["*"]
    path_matcher = "all"
  }

  path_matcher {
    name        = "all"
    default_service = google_compute_backend_service.api.self_link
    path_rule {
      paths   = ["/api", "/api/*"]
      service = google_compute_backend_service.api.self_link
    }
  }
}

resource "google_compute_backend_service" "api" {
  project = var.project_id

  name        = "${var.name}-api"
  description = "API Backend for ${var.name}"
  port_name   = "http"
  protocol    = "HTTP"
  timeout_sec = 10
  enable_cdn  = false

  backend {
    group = var.instancegroup
  }

  health_checks = [google_compute_health_check.default.self_link]

  depends_on = [var.module_depends_on]
}

resource "google_compute_health_check" "default" {
  project = var.project_id
  name    = "${var.name}-hc"

  http_health_check {
    port         = 80
    request_path = "/api"
  }

  check_interval_sec = 5
  timeout_sec        = 5
}