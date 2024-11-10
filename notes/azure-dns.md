```bash
az aks get-credentials --resource-group "${AZ_RESOURCE_GROUP_NAME}" --name "${AZ_AKS_CLUSTER_NAME}"

az keyvault create --resource-group "${AZ_RESOURCE_GROUP_NAME}" --location "${AZ_REGION}" --name "${AZ_KEYVAULT_NAME}" --enable-rbac-authorization true

openssl pkcs12 -inkey "${PWD}/certs/swamibot.key" -in "${PWD}/certs/swamibot.crt" -export -out "${PWD}/certs/swamibot.pfx"

az keyvault certificate import --vault-name "${AZ_KEYVAULT_NAME}" --name swamibot-tls --file "${PWD}/certs/swamibot.pfx"

```