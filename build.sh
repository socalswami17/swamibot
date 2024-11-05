#!/usr/bin/env bash

set -xe

IMAGE_ORG_NAME_TAG="${AZ_ACR_NAME}.azurecr.io/swamibot:dev"

docker build -t "${IMAGE_ORG_NAME_TAG}" .

# az acr login --name "${AZ_ACR_NAME}"

# pay-as-you-go subscription required
az acr build --registry "${AZ_ACR_NAME}" --image "${IMAGE_ORG_NAME_TAG}" .

# AZ_ACR_TOKEN="$(az acr login -n "${AZ_ACR_NAME}" --expose-token .accessToken)"
# AZ_SUBSCRIPTION_ID="$(az account show .id)"

# docker login "${AZ_ACR_NAME}.azurecr.io" --username "${AZ_SUBSCRIPTION_ID}" --password "${AZ_ACR_TOKEN}"

# az role assignment list --scope "/subscriptions/${AZ_SUBSCRIPTION_ID}/resourceGroups/${AZ_RESOURCE_GROUP_NAME}/providers/Microsoft.ContainerRegistry/registries/${AZ_ACR_NAME}" -o table
# az aks update -n "${AZ_AKS_CLUSTER_NAME}" -g "${AZ_RESOURCE_GROUP_NAME}" --attach-acr "${AZ_ACR_NAME}"
