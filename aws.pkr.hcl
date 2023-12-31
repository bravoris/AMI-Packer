packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}


source "amazon-ebs" "amazon-linux" {
  profile       = "default"
  ami_name      = "Packer-build-ami"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami    = "ami-05d47d29a4c2d19e1"
  ami_users     = [ "411812903382" ]
  ami_regions   = [ "us-east-1" ]
  ssh_username  = "ubuntu"
}

build {
    name = "custom-image"
    sources = [
        "source.amazon-ebs.amazon-linux"
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
