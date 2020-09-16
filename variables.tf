variable "environments_name" {
  type        = string
  default     = "bastion"
  description = "Ambiente de desenvolvimento basico"
}


variable "instance_count" {
  default = 1
}

variable "key_name" {
  description = "Private key name to use with instance"
  default     = "terraform"
}

variable "instance_type" {
  description = "AWS instance type"
  default     = "t3.medium"
}

variable "ami" {
  description = "Base AMI to launch the instances"

  # Bitnami NGINX AMI
  default = "ami-021acbdb89706aa89"
}


variable "ip_home" {
  description = "AWS instance type"
  default     = ["34.95.146.9/32"]
}