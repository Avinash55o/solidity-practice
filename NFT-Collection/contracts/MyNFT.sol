// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
contract MyNFT is ERC721URIStorage, Ownable{
    uint256 private _nextTokenId=1;
    constructor(address initialowner) Ownable(initialowner) ERC721("MyNFT","MNT"){
    }

    function mint(address to, string memory tokenURI) public onlyOwner{
          uint256 newTokenId=_nextTokenId++;
          _safeMint(to, newTokenId); //safely mint a new nft. u can use _mint also
          _setTokenURI(newTokenId,tokenURI); //set the metadata uri
    }

    function getOwner()public view returns(address){
        return owner();
    }
}