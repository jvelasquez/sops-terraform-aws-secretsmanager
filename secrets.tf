# ---------------------------------------------------------------------------------------------------------------------
# prod secrets
# ---------------------------------------------------------------------------------------------------------------------
variable "prod_rds_user" {
  description = "RDS User for Production"
}
resource "aws_secretsmanager_secret" "prod_rds_user" {
  name                    = "prod/rds_user"
  description             = "RDS User for Production"
  recovery_window_in_days = 7
}
resource "aws_secretsmanager_secret_version" "prod_rds_user" {
  secret_id     = "${aws_secretsmanager_secret.prod_rds_user.id}"
  secret_string = "${var.prod_rds_user}"
}
variable "prod_rds_password" {
  description = "RDS Password for Production"
}
resource "aws_secretsmanager_secret" "prod_rds_password" {
  name                    = "prod/rds_password"
  description             = "RDS Password for Production"
  recovery_window_in_days = 7
}
resource "aws_secretsmanager_secret_version" "prod_rds_password" {
  secret_id     = "${aws_secretsmanager_secret.prod_rds_password.id}"
  secret_string = "${var.prod_rds_password}"
}
# ---------------------------------------------------------------------------------------------------------------------
# dev secrets
# ---------------------------------------------------------------------------------------------------------------------
variable "dev_rds_user" {
  description = "RDS User for Development"
}
resource "aws_secretsmanager_secret" "dev_rds_user" {
  name                    = "dev/rds_user"
  description             = "RDS User for Development"
  recovery_window_in_days = 7
}
resource "aws_secretsmanager_secret_version" "dev_rds_user" {
  secret_id     = "${aws_secretsmanager_secret.dev_rds_user.id}"
  secret_string = "${var.dev_rds_user}"
}
variable "dev_rds_password" {
  description = "RDS Password for Development"
}
resource "aws_secretsmanager_secret" "dev_rds_password" {
  name                    = "dev/rds_password"
  description             = "RDS Password for Development"
  recovery_window_in_days = 7
}
resource "aws_secretsmanager_secret_version" "dev_rds_password" {
  secret_id     = "${aws_secretsmanager_secret.dev_rds_password.id}"
  secret_string = "${var.dev_rds_password}"
}
