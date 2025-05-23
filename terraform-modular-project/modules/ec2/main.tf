resource "aws_instance" "NBK_EC2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  key_name               = var.key_name


user_data = <<-EOF
              #!/bin/bash -xe
              apt-get update -y
              apt-get install -y apt-transport-https ca-certificates curl software-properties-common

              curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
              add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
              apt-get update -y
              apt-get install -y docker-ce

              systemctl enable docker
              systemctl start docker

              docker pull shivaram1918/netflix:latest
              docker run -d -p 80:80 shivaram1918/netflix:latest

              echo "Netflix container deployed successfully" >> /var/log/user_data.log
EOF

tags = {
  Name = var.ec2_name
}

}