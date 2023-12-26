# MultiSend Smart Contract

## Overview

The MultiSend smart contract is a simple Ethereum smart contract written in Solidity that allows the owner to manage and distribute Ether to multiple addresses in a single transaction.

## Features

- **Ownership Management**: The contract includes functionality to change the owner of the contract.
- **Ether Storage**: The owner can store Ether in the contract.
- **Multi-address Ether Transfer**: The owner can send Ether to multiple addresses in a single transaction.

## Getting Started

### Prerequisites

- foundry installed
- Anvil (comes installed with forge)
- An Ethereum development environment (Ganache, etc.)

### Installation

1. Clone the repository: `git clone https://github.com/oseitutunelson/foundry_MultiSend.git`


### Testing

1. Run your Ethereum development environment (Ganache, or anvil etc.).
2. Run the  tests: `forge test`

### Deployment

1. forge script script/DeployMultiSend.s.sol --rpc-url (anvil or ganache rpc url) --private-key (private key of one anvil or ganache account) --broadcast.

