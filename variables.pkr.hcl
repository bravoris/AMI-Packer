variable profile {
    type = string
    value = "default"
}

variable ami_name {
    type = string
    value = "Packer-build-ami"
}

variable instance_type {
    type = string
    value = "t2.micro"
}

variable region {
    type = string
    value = "us-east-1"
}

variable source_ami {
  type = string
  value = "ami-05d47d29a4c2d19e1"
  validation {
    condition     = length(var.source_ami) > 4 && substr(var.source_ami, 0, 4) == "ami-"
    error_message = "The image_version value must be a valid source_ami, starting with \"ami-\"."
  }
}
variable ssh_username {
  type = string
  value = "ubuntu"
}
variable ami_users {
  type = string
  value = "411812903382"
}
variable ami_regions {
  type = list(string)
  value = "us-east-1"
}     
