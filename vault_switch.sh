export DEV_TOKEN=$(cat ~/.config/vault/token)

dev_vault() {
    export VAULT_ADDR=https://dev-vault.clearme.com
    export VAULT_TOKEN="${DEV_TOKEN}"
    check_token=$(vault print token)
    if [ "${check_token}" != "${DEV_TOKEN}" ]; then
        vault login
        echo "You are now authenticated to dev vault"
    fi
}

prod_vault() {
    export VAULT_ADDR=https://vault.clearme.com
    export VAULT_TOKEN=$(curl --header "X-Vault-Token: ${DEV_TOKEN}" \
        --request POST \
        --data @~/.config/vault/wrapped_payload.json \
        https://dev-vault.clearme.com/ui/vault/tools/unwrap | jq '.data.prod')
    vault login
}
