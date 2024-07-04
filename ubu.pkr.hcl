  packer {
    required_plugins {
      amazon = {
        version = ">= 0.0.1"
        source  = "github.com/hashicorp/amazon"
      }
    }
  }

  source "amazon-ebs" "example" {
    region = "ap-south-1"
    source_ami = "ami-0c2af51e265bd5e0e" 
    instance_type = "t2.micro"
    ssh_username = "ubuntu"
    ami_name = "my_ubu"
    tags = {
      Name = "MyEC2Instance" 
    }
    ssh_pty = true 
    ssh_timeout = "10m"
  }

  build {
    sources = ["source.amazon-ebs.example"]

    provisioner "shell" {
      scripts = [
        "install_one.sh"
      ]
    }
  }
