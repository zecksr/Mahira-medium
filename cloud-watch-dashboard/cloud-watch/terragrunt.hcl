terraform {
  source = "../module"
}
include "root" {
  path = find_in_parent_folders()
}
locals {
  instance_id = "i-jjb8967799756njbd"
  region = "us-east-1"
}
inputs = {
  dashboard_name = "ec2-cloud_watch-dashboard"
  instance_id    = local.instance_id
  region         = local.region
 }