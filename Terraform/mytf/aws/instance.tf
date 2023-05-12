#data source for ami lookup

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["get value from aws"]
  filter {
    name   = "name"
    values = ["${var.imageName}"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output "ami_id" {
  value = data.aws_ami.ubuntu.id
}

#create instance
module "myWebServer"{
    source ="./modules/webserver"
    image_id=""
    instance_type=""
    }

output "publicIp"{
  value=module.myWebServer.publicIP
}

resource "aws_instance" "web" {
  ami                    = "${data.aws_ami.ubuntu.id}"
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.key-tf.key_name
  vpc_security_group_ids = ["${aws_security_group.first-security-group.id}"]

  tags = {
    Name = "first-tf_instance"
  }
  user_data = file("${path.module}/script.sh")


  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/id_rsa")
    host        = self.public_ip
  }


  #types of provisioner as file,local-exec,remote-exec
  provisioner "file" {
    source      = "readme.md"      #terraform machine
    destination = "/tmp/readme.md" #remote machine
  }

  provisioner "file" {
    content     = "this is harsh"   #terraform machine
    destination = "/tmp/content.md" #remote machine
  }

  provisioner "local-exec" {
    on_failure = continue
    command = "echo ${self.public_ip} >/tmp/mypublicIp.txt"
  }

  provisioner "local-exec" {
    working_dir = "/tmp/"
    command     = "echo ${self.public_ip} >mypublicIp.txt"
  }

  provisioner "local-exec" {
    interpreter = [
      "/usr/bin/python", "-c"
    ]
    command = "print('Hello harsh')"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo 'at delete'"
  }

  provisioner "remote-exec"{
     inline = [
      "ipconfig",
      "echo 'hello harsh'"
    ]
    script ="./script.sh"
  }
}

#terraform backend

#need aws cli to be installed 

#aws configure
#apt-get install awscli

terraform {
  backend "s3"{
    bucket=
    region=
    ##tf state file name
    key="terraform.tfstate"
    dynamodb_table=""
  }
}