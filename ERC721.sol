// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC721 {
    uint256 public mintPrice=0.05 ether;
    uint256 public totalSupply;
    uint256 public maxSupply;
    bool public isMintenabled;
    mapping (address=>uint256) public mintedWallets;
        constructor() payable  ERC721("MyToken", "MTK") {
            maxSupply=2;
        }

        function toggleIsMintEnabled() external onlyOwner{
            isMintenabled=!isMintenabled;
        } 

       function setmaxSupply(uint256 maxSupply_) external onlyOwner{
         maxSupply=maxSupply_;
       }

       function mint() external payable {
        require(isMintenabled,'minting not enabled');
        require(mintedWallets[msg.sender]<1,'exceeds max per wallet');
        require(msg.value==mintPrice,'wrong value');
        require(maxSupply>totalSupply,'sold out');

        mintedWallets[msg.sender]++;
        totalSupply++;
        uint256 tokenId = totalSupply;
        _safeMint(msg.sender,tokenId);
       }
}
