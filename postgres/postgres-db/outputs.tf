output "db_arn" {
  value = aws_db_instance.postgres_rds.arn
}

output "db_endpoint" {
  value = aws_db_instance.postgres_rds.endpoint
}

output "db_az" {
  value = aws_db_instance.postgres_rds.availability_zone
}

output "subnet_group_arn" {
  value = aws_db_subnet_group.db-subnet.arn
}

output "subnet1_id" {
  value = aws_subnet.db_subnet[0].id
}
output "subnet2_id" {
  value = aws_subnet.db_subnet[1].id
}
output "subnet3_id" {
  value = aws_subnet.db_subnet[2].id
}
output "vpc_id" {
  value = aws_vpc.default.id
}