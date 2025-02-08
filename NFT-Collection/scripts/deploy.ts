import { ethers } from "hardhat";
require('dotenv').config();

async function main() {
  const MyNFT = await ethers.getContractFactory("MyNFT");

  const initialOwner = process.env.INITIALOWNER!; //the smart contract asking for the initial owner address.
  const myNFT = await MyNFT.deploy(initialOwner); // initial owner represent  the address that owns the the contract.

  await myNFT.waitForDeployment();
  console.log("Contract deployed to:", await myNFT.getAddress()); //represents the location of the deployed smart contract
  const owner = await myNFT.owner();
  console.log("current owner:", owner);

  console.log("initial owner is:", initialOwner);

  const to =process.env.INITIALOWNER!; // Address to receive the NFT

  const tokenURI =
   process.env.TOKEN_URI!;

  const txn = await myNFT.mint(to,tokenURI);
  await txn.wait();
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
