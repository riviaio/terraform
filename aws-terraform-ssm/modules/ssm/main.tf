resource "aws_ssm_parameter" "secret" {
  name              = var.name
  type              = "SecureString"
  value             = var.value
  description       = var.description
  tier              = var.tier
  key_id            = var.key_id
  overwrite         = var.overwrite
  allowed_pattern   = var.allowed_pattern
  data_type         = var.data_type
  # tags = {
  #   environment = local.environment
  # }
}