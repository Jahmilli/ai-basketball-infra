#!/bin/bash
sudo su -
yum update -y

# Install NGINX
amazon-linux-extras install nginx1 -y

aws s3 cp s3://ai-basketball-applications/ai-basketball-ws.zip .
unzip ai-basketball-ws.zip

# LOG_LEVEL=debug POSTGRESQL_USER=postgres POSTGRESQL_PASSWORD=password POSTGRESQL_DATABASE=mydb node /root/ai-basketball-ws/dist/index.js
amazon-linux-extras install postgresql10

# Update /etc/nginx/nginx.conf (Note, this should be backed up originally and also point to other configs)
nginx -t # Validate config
nginx -s reload # Reload configuration if it's been updated
systemctl enable nginx
systemctl start nginx
# systemctl restart nginx

# Install Nodejs
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
# . ~/.nvm/nvm.sh
# nvm install v12.18.0

touch ~/.bashrc # this ensure the bashrc file is created
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
source ~/.bashrc
nvm install 7

# Setup SystemD Services
# TODO: Copy service files over
# vi /etc/systemd/system/ai-basketball-ws.service
systemctl enable ai-basketball-ws
systemctl start ai-basketball-ws