# Minimal NFT Whitelist (Merkle Tree)

This repository provides a professional implementation of an NFT whitelist system. Instead of storing thousands of addresses on-chain (which is prohibitively expensive), this project uses **Merkle Proofs**.

## Why Merkle Trees?
Storing 1,000 addresses in a mapping can cost millions in gas. By using a Merkle Root, you only store a single `bytes32` value on-chain. Users provide a "proof" to mint, shifting the data burden off-chain while maintaining cryptographic security.

## How to Use
1. Generate a Merkle Root from your list of addresses using `merkletreejs`.
2. Deploy the contract with that root.
3. Users mint by passing their specific Merkle Proof to the `mint` function.

## Tech Stack
- **Solidity ^0.8.20**
- **OpenZeppelin Contracts** (Cryptography & ERC-721)
- **Foundry** (Testing & Deployment)
