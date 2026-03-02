resource "google_sql_database_instance" "postgres" {
  name             = var.instance_name
  database_version = var.db_version
  region           = var.region

  settings {
    tier = var.db_tier

    ip_configuration {
      ipv4_enabled    = false
      private_network = var.network_id
    }

    backup_configuration {
      enabled = true
    }
  }

  encryption_key_name = var.kms_key
   depends_on = [
    google_service_networking_connection.private_vpc_connection
  ]
}