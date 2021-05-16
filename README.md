# AI Basketball Infra

## Description

Terraform scripts to set up the required infrastructure to run the AI Basketball Application

### Setup

Run: `ENVIRONMENT=nonprod TERRAFORM_RUN="apply" ./scripts/build.sh`

### Removal

Run: `ENVIRONMENT=nonprod TERRAFORM_RUN="destroy" ./scripts/build.sh`


## Manual Setup

Create the following buckets in S3 with public access blocked:
  - aibasketball
  - ai-basketball-applications

Note: The reason these are manually created is so that we don't accidentally delete all of videos or versioned applications if we run terraform destroy.

### Setting up instances

1. Run: `ENVIRONMENT=nonprod TERRAFORM_RUN="apply" ./scripts/build.sh`
2. ssh onto the VM
3. Run: `sudo su -`
4. Run all steps from userdata.sh in the VM (As it's currently failing). Make sure to update the systemd services and /etc/nginx/nginx.conf
5. Need to add in ~/.aws/credentials with correct access token and secret access token
6. Connect to the database and create the tables

### TODO:

- Install NGINX on the server
- Install Nodejs on the server
- Pull application build from S3
- Setup NGINX and SystemD scripts to run applications
- Setup Route53 to Server
- Fix up Security Groups for HTTP Traffic
- Setup Certs???

