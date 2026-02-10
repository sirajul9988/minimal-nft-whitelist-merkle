const { MerkleTree } = require('merkletreejs');
const keccak256 = require('keccak256');

// Example whitelist addresses
const whitelistAddresses = [
    "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
    "0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2"
];

const leaves = whitelistAddresses.map(addr => keccak256(addr));
const tree = new MerkleTree(leaves, keccak256, { sortPairs: true });
const root = tree.getHexRoot();

console.log('Merkle Root:', root);

// Generate proof for the first address
const leaf = keccak256(whitelistAddresses[0]);
const proof = tree.getHexProof(leaf);
console.log('Proof for Address 0:', proof);
