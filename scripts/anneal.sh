if [ "$1" == "devnet" ]; then
    # namespace == devnet-pull
    az aks get-credentials --resource-group Default --name multichain-devnet
    helm upgrade -i pull-oracle-devnet ./charts/pull-service/ -f ./chains/solana/devnet-pull.yaml
elif [ "$1" == "equinix-devnet" ]; then
    # namespace == devnet-pull
    cp ~/.kube/config-equinix ~/.kube/config
    helm upgrade -i pull-oracle-devnet ./charts/pull-service/ -f ./chains/solana/devnet-pull-equinix.yaml
else
    echo "Invalid argument. Please use either 'mainnet' or 'devnet'."
fi

