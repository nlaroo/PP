packer {
  required_plugins {
    amazon = {
      version = ">= 1.10.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "palworld" {
  ami_name      = "palworld-server-${timestamp}"

  source_ami_filter{
    filters = {
        name = 	"ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
        root-device-type = "ebs"
        virtualization-type = "hvm"
    }
    most_recent = true
    owners = ["amazon"]
  }
  instance_type = "t3.xlarge"
  region        = "us-east-1"
# source_ami =  "ami-0c7217cdde317cfec"
  ssh_username = "ubuntu"
}

build {
    sources = [
        "source.amazon-ebs.palworld
    ]

    provisioner "shell" {
        script = ".app.sh"
    }
}