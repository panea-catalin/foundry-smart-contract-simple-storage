-include .env

.PHONY: all test deploy

build :; forge build

test :; forge test

install :; forge install foundry-rs/forge-std@v1.8.2 --no-commit

remove :; rm -rf .gitmodules && rm -rf .git/modules/* && rm -rf lib && touch .gitmodules && git add . && git commit -m "modules"

deploy-local :
	@forge script script/DeploySimpleStorage.s.sol:DeploySimpleStorage --rpc-url http://localhost:8545 --account defaultKey --broadcast -vvvv

deploy-sepolia :
	@forge script script/DeploySimpleStorage.s.sol:DeploySimpleStorage --rpc-url $(SEPOLIA_RPC_URL) --account sepolia-wallet --broadcast --verify -vvvv