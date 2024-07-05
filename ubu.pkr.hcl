  packer {
    required_plugins {
      amazon = {
        version = ">= 0.0.1"
        source  = "github.com/hashicorp/amazon"
      }
    }
  }

  source "amazon-ebs" "example" {
    region = "enter your preferable region"
    source_ami = "ami-123456789" //enter your source image which you want to use
    instance_type = "t2.micro"
    ssh_username = "ubuntu"
    ami_name = "enter  image name which you want"
    tags = {
      Name = "enter your tag name" 
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
