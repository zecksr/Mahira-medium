terraform {
  source = "../module/ec2"
}

include {
  path = find_in_parent_folders()
}

inputs = {}
