# Simple Storage — Foundry Smart Contract

## Description

This project contains a minimal Solidity smart contract demonstrating basic storage operations using the Foundry development framework. The contract allows storing and retrieving a number, as well as adding people with associated favorite numbers using structs and mappings.

It includes a deployment script and Makefile commands for building, testing, and deploying locally or to Sepolia.

---

## Requirements

* Foundry
* Git
* Make (optional but recommended)
* Access to an RPC endpoint (for testnet deployment)

Install Foundry:

```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

---

## Setup

Environment variables (for Sepolia deployment):

Create a `.env` file:

```
SEPOLIA_RPC_URL=<your_rpc_url>
```

Import wallet keys:

```bash
cast wallet import defaultKey --interactive
cast wallet import sepolia-wallet --interactive
```

---

## Commands

Build contracts:

```bash
make build
```

Run tests:

```bash
make test
```

Install dependencies:

```bash
make install
```

Deploy locally (Anvil must be running):

```bash
make deploy-local
```

Deploy to Sepolia:

```bash
make deploy-sepolia
```

---

## Interacting with the Contract (Foundry Tools)

After deployment, you can interact with the contract using `cast`.

Set variables:

```bash
export CONTRACT_ADDRESS=0x5FbDB2315678afecb367f032d93F642f64180aa3
export RPC_URL=http://localhost:8545
```

### Read stored value

```bash
cast call $CONTRACT_ADDRESS "retrieve()(uint256)" --rpc-url $RPC_URL
```

### Store a new value

```bash
cast send $CONTRACT_ADDRESS \
"store(uint256)" 42 \
--rpc-url $RPC_URL \
--account defaultKey
```

### Add a person

```bash
cast send $CONTRACT_ADDRESS \
"addPerson(string,uint256)" "Alice" 7 \
--rpc-url $RPC_URL \
--account defaultKey
```

### Query mapping

```bash
cast call $CONTRACT_ADDRESS \
"nameToFavoriteNumber(string)(uint256)" "Alice" \
--rpc-url $RPC_URL
```

---

## Output

Example successful local deployment output:

* Contract Address:
  `0x5FbDB2315678afecb367f032d93F642f64180aa3`

* Gas Used:
  `547745`

* Block Number:
  `1`

---


## License

MIT License
