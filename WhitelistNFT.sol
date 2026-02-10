// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title WhitelistNFT
 * @dev ERC721 token with Merkle Tree whitelist verification.
 */
contract WhitelistNFT is ERC721, Ownable {
    bytes32 public merkleRoot;
    mapping(address => bool) public hasMinted;

    constructor(bytes32 _merkleRoot) ERC721("WhitelistNFT", "WNFT") Ownable(msg.sender) {
        merkleRoot = _merkleRoot;
    }

    /**
     * @dev Mint function for whitelisted users.
     * @param proof The Merkle Proof provided by the user.
     */
    function whitelistMint(bytes32[] calldata proof) external {
        require(!hasMinted[msg.sender], "Already minted");
        
        // Verify the proof
        bytes32 leaf = keccak256(abi.encodePacked(msg.sender));
        require(MerkleProof.verify(proof, merkleRoot, leaf), "Invalid Merkle Proof");

        hasMinted[msg.sender] = true;
        _safeMint(msg.sender, totalSupply() + 1);
    }

    // Basic mock of totalSupply for demonstration
    uint256 private _tokenIds;
    function totalSupply() public view returns (uint256) {
        return _tokenIds;
    }
}
