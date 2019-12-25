#!/bin/sh

yum install docker -y
yum install -y amazon-efs-utils

# makes a directory
mkdir /nextclouddata
mount -t efs fs-36e1116e:/ /nextclouddata


# enable and start docker
systemctl enable docker
systemctl start docker

# bootstraps "docker compose"
curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
usermod -aG docker ec2-user

# Heredoc for a docker-compose.yaml file
cat << 'EOF' > /home/ec2-user/docker-compose.yaml
version: '2'

volumes:
  nextcloud

services:
  app:
    image: nextcloud
    ports:
      - 8080:80
    volumes:
      - nextcloud:/var/www/html
    restart: always
    environment:
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=test
      - MYSQL_PASSWORD=<redacted>
      - MYSQL_HOST=<redacted>
EOF

docker-compose -f /home/ec2-user/docker-compose.yaml up
