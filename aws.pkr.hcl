packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}


source "amazon-ebs" "amazon-linux" {
  profile       = var.profile
  ami_name      = var.ami_name
  instance_type = var.instance_type
  region        = var.region
  source_ami    = var.source_ami
  ami_regions   = var.ami_regions
  ssh_username  = var.ssh_username
}

build {
    name = "custom-image"
    sources = [
        ""source.amazon-ebs.amazon-linux""
    ]


provisioner "file" {
    source = "provisioner.sh"
    destination = "/tmp/provisioner.sh"
    }

provisioner "shell" {
    inline = [ "chmod a+x /tmp/provisioner.sh" ]
    }

provisioner "shell" {
    inline = [ "/tmp/provisioner.sh" ]
    }
}