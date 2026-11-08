# Docker Documentation

## install AZ Cli

curl -sL <https://aka.ms/InstallAzureCLIDeb> | sudo bash

## login to Azure Account

sudo az login --use-device-code

## Show Azure Account Information

az account show

## Docker Login to Azure ACR

### Set Environment Variables

export DOCKER_TOKEN=''
export DOCKER_USER_LOGIN=''

### login

sudo docker login -u $DOCKER_USER_LOGIN -p $DOCKER_TOKEN account.azurecr.io
sudo docker pull account.azurecr.io/account/ruleengine:latest

### Testing

sudo docker pull nginx
