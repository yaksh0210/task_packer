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
  source_ami = "ami-05e00961530ae1b55" 
  instance_type = "t2.micro"
  ssh_username = "ubuntu"
  ami_name = "my_ubu"
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
