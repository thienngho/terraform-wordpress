
# Terraform-wordpress assessment

This is an assessment of fully automated deployment of [Wordpress](https://wordpress.org) app and [Netdata](https://my-netdata.io) to AWS using Terraform, Ansible and shell script or using Vagrant, Ansible for local environment.

## Prerequisite

1. Install [Terraform](https://www.terraform.io/intro/getting-started/install.html)
2. Install [Ansible](http://docs.ansible.com/ansible/intro_installation.html)
3. Install [awscli](http://docs.aws.amazon.com/cli/latest/userguide/installing.html)
4. [Configure awscli](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html) with key and secret (`aws configure`)
5. Install [Vagrant](https://www.vagrantup.com)

### Quickstart

1. git clone https://github.com/thienngho/terraform-wordpress.git
2. cd terraform-wordpress

### For AWS
`./deploy.sh --app=<app_name> --environment=<environment>`


#### Example

`./deploy.sh --app=wp --environment=dev`


#### Clean-up

`rm ansible-key* && terraform destroy ./terraform`

### With Vagrant
`vagrant up --provision`

Wordpress site: `http://192.168.50.2`
Netdata site: `http://192.168.50.2/netdata`
