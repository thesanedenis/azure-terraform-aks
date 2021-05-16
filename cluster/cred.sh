#!/bin/bash
az login
az account list -o table                                                              
az account set --subscription 518e6a01-c371-41eb-b08f-285d6cc97f01

# SUBSCRIPTION=518e6a01-c371-41eb-b08f-285d6cc97f01
SERVICE_PRINCIPAL_JSON=$(az ad sp create-for-rbac --skip-assignment --name aks-getting-started-sp -o json)
# SERVICE_PRINCIPAL=$(echo $SERVICE_PRINCIPAL_JSON | jq -r '.appId')
# SERVICE_PRINCIPAL_SECRET=$(echo $SERVICE_PRINCIPAL_JSON | jq -r '.password')

# erraform plan -var serviceprinciple_id=$SERVICE_PRINCIPAL \
#     -var serviceprinciple_key="$SERVICE_PRINCIPAL_SECRET" \
#     -var tenant_id=$TENTANT_ID \
#     -var subscription_id=$SUBSCRIPTION \
#     -var ssh_key="$SSH_KEY"


export TF_VAR_subscription_id=518e6a01-c371-41eb-b08f-285d6cc97f01
export TF_VAR_serviceprinciple_id=$(echo $SERVICE_PRINCIPAL_JSON | jq -r '.appId')
export TF_VAR_serviceprinciple_key=$(echo $SERVICE_PRINCIPAL_JSON | jq -r '.password')
export TF_VAR_ssh_key="~/.ssh/id_rsa.pub"
export TF_VAR_tenant_id=$(echo $SERVICE_PRINCIPAL_JSON | jq -r '.tenant')