packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "example" {
  region = "Enter Your Region"
  source_ami = "ami-1234567890" 
  instance_type = "t2.micro"
  ssh_username = "ubuntu"
  ami_name = "Enter your image name"
  tags = {
    Name = "MyEC2Instance" 
  }
}

build {
  sources = ["source.amazon-ebs.example"]

  provisioner "shell" {
    scripts = [
      "install_one.sh"
    ]
  }
}
