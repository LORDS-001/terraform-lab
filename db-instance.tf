resource "google_sql_database_instance" "mysql_instance_1" {
  name             = "mysql-db-1"
  region           = "us-central1"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = false
}

resource "google_sql_database_instance" "mysql_instance_2" {
  name             = "mysql-db-2"
  region           = "southamerica-west1"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = false
}

resource "google_sql_database_instance" "postgres_instance" {
  name             = "postgres-db-3"
  region           = "northamerica-south1"
  database_version = "POSTGRES_15"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = false
}