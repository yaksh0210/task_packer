  packer {
    required_plugins {
      amazon = {
        version = ">= 0.0.1"
        source  = "github.com/hashicorp/amazon"
      }
    }
  }

  source "amazon-ebs" "example" {
    region = "Enter your preferable region"
    source_ami = "ami-1234567890" 
    instance_type = "t2.micro"
    ssh_username = "name of user of ec2 while doing ssh"
    ami_name = "your image name"
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
