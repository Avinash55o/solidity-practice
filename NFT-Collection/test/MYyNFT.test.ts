import { expect } from "chai";
import { ethers } from "hardhat";

describe("MyNFT", function () {
  it("Should deploy and mint a token", async function () {
    const [owner] = await ethers.getSigners();

    // Deploy the contract
    const MyNFT = await ethers.getContractFactory("MyNFT");
    const myNFT = await MyNFT.deploy(owner.address);
    await myNFT.waitForDeployment();

    // Mint a token
    const tokenId = 1;
    const tokenURI="https://ipfs.io/ipfs/bafkreid4q7eyj6ehrsu7dyjgefewmsbyjyqjpiae426g33tpluj6lodgwa"
    await myNFT.mint(owner.address,tokenURI);

    // Check ownership
    const tokenOwner = await myNFT.ownerOf(tokenId);
    expect(tokenOwner).to.equal(owner.address);
  });
});