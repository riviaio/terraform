variable name {
  type        = string
  description = "The name of the parameter."
}

variable value {
  type        = string
  description = "The value of the parameter."
}

variable description {
  type        = string
  description = "The description of the parameter."
  default     = ""
}

variable tier {
  type        = string
  description = "The tier of the parameter. If not specified, will default to Standard. Valid tiers are Standard, Advanced, and Intelligent-Tiering."
}

variable  key_id {
  type        = string
  description = "The KMS key id or arn for encrypting a SecureString."
}

variable overwrite {
  type        = string
  description = "Overwrite an existing parameter."
  default     = "false"
}

variable  allowed_pattern {
  type        = string
  description = "A regular expression used to validate the parameter value."
}

variable  data_type {
  type        = string
  description = "The data_type of the parameter. Valid values: text and aws:ec2:image for AMI format"
  default     = ""
}

# variable tags {
#   type            = map(string)
#   Description     = "Additional tags (e.g. `map('BusinessUnit','XYZ')`"
#   Default         = {}
# }
