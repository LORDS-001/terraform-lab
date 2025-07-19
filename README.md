# terraform-lab

## Creation of Subnets
I created 2 more subnets including the subnet we have before makes it 3 subnets
To create a subnet:
- I created a "google_compute_subnetwork" "subnet2" resource for the first subnet named "my-subnet-2" with the IP range ""10.0.1.0/24" in the region  "southamerica-west1" under the vpc created earlier "my-vpc"
- I created another "google_compute_subnetwork" "subnet3" resource for the second subnet named "my-subnet-3" with the IP range ""10.0.2.0/24" in the region  "northamerica-south1" under the vpc created earlier "my-vpc"

## Configuring Firewall rules
In other to configure a firewall rule, you must have a VPC network and Subnetwork
Since we already have both, I proceeded to configuring a firewall rule to allow HTTP/HTTPS traffic for both subnets I created.
To configure a firewall:
- HTTP: I created a "google_compute_firewall" "allow-http" resource for the HTTP named "allow-http" in the vpc network I already had, and allowed a protocol named "tcp" with the ports "80", with the direction "INGRESS" which has the source_ranges "0.0.0.0/0" and target_tags "http-server"
- HTTPS: I created another "google_compute_firewall" "allow-https" resource for the HTTPS named "allow-https" in the vpc network I already had, and allowed a protocol named "tcp" with the ports "443", with the direction "INGRESS" which has the source_ranges "0.0.0.0/0" and target_tags "https-server"

## Provision Compute Engine VM Instances
In other to create VMs for the two subnets I created using different image for each VM:
- I created a "google_compute_instance" "test-vm2" resource named "my-vm-2" with the machine type "e2-micro" in the zone "southamerica-west1-a".  For this VM, I  used the image "ubuntu-os-cloud/ubuntu-2204-lts".  In other to specify that this VM is for the first subnet I  created, I specified in the network interface the subnet to be used by indicating "google_compute_subnetwork.subnet2.id"
- I created a "google_compute_instance" "test-vm3" resource named "my-vm-3" with the machine type "e2-micro" in the zone "northamerica-south1-a".  For this VM, I  used the image "debian-cloud/debian-12".  In other to specify that this VM is for the first subnet I  created, I specified in the network interface the subnet to be used by indicating "google_compute_subnetwork.subnet3.id"

## Creation of Cloud Storage Buckets
In other to create cloud storage buckets in different locations:
- I created a "google_storage_bucket" "gcp-bucket2" resource named "nexedge-bucket-daniel91509" in the location "EU" with the storage class "STANDARD" and uniform_bucket_level_access "true"
- I created a "google_storage_bucket" "gcp-bucket3" resource named "nexedge-bucket-daniel80320" in the location "ASIA" with the storage class "STANDARD" and uniform_bucket_level_access "true"

## Provision of Database Instances
In other to create different Database Instances:
- I created a "google_sql_database_instance" "mysql_instance_2" resource named "mysql-db-2" in the region "southamerica-west1" with the database_version "MYSQL_8_0", setting the tier to "db-f1-micro" and deletion_protection  as false
- I created a "google_sql_database_instance" "postgres_instance" resource named "postgres-db-3" in the region "northamerica-south1" with the database_version "POSTGRES_15", setting the tier to "db-f1-micro" and deletion_protection  as false