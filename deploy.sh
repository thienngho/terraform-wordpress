#!/bin/bash

# ./deploy.sh --app=test --environment=staging

for i in "$@"
do
    case $i in
        --app=*)
            APP="${i#*=}"
            ;;
        --environment=*)
            ENVIRONMENT="${i#*=}"
            ;;
        *)
            # unknown option
            ;;
    esac
done

# check if awscli installed or not
if [[ -z "$(type aws)" ]]; then
  read -p "aws cli is not installed. Installing aws cli. and logging in Press [Enter]..."
  sudo pip install awscli 
  aws configure
elif [[ -z "$(find ~/.aws -iname "credentials")" ]]; then
  # login if not yet logged
  echo "Not loggedin to AWS, if you dont have the credentials get it from AWS Console"
  read -p "To continue and Login to AWS now. Press [Enter]..." 
  aws configure
fi

terraform=$(which terraform)
ansible=$(which ansible-playbook)

if [ ! -e ./ansible-key ]
then
    ssh-keygen -t rsa -b 4096 -f ./ansible-key -N ''
fi

$terraform init ./terraform
echo $terraform apply -auto-approve -var app_name=${APP} -var environment=${ENVIRONMENT} ./terraform
$terraform apply -auto-approve -var app_name=${APP} -var environment=${ENVIRONMENT} -var ssh_key="$(cat ./ansible-key.pub)" ./terraform

echo '[wordpress]' > ansible/inventory

$terraform output public_ip_wp | sed -e 's/,$//' >> ansible/inventory

sleep 10
echo $ansible -i ./ansible/inventory --key-file="./ansible-key" ./ansible/site.yml
$ansible -i ./ansible/inventory --key-file="./ansible-key" ./ansible/site.yml 

echo "Connect to Wordpress using below IP"
echo http://$(terraform output public_ip_wp)

echo "Connect to Netdata using below IP"
echo http://$(terraform output public_ip_wp)/netdata
