terraform {
  backend "s3" {
    bucket = "talent-academy-jabreelabdi"
    key    = "terraform-vpc/terraform.tfstates"
  }
}