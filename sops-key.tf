provider "aws" {
  region = "eu-west-1"
}
resource "aws_kms_key" "sops_key" {
  description             = "KMS Key for sops"
  deletion_window_in_days = 7
}
resource "aws_kms_alias" "sops_key" {
  name          = "alias/sops-key"
  target_key_id = "${aws_kms_key.sops_key.key_id}"
}
