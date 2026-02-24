import hre from "hardhat";

async function main() {
const Charity = await hre.ethers.getContractFactory("Charity"); 
const charity = await Charity.deploy(ethers.utils.parseEther("5"));  

  console.log("Sedang mendeploy Vault...");
  // Memasukkan pesan awal ke constructor
  const vault = await Vault.deploy("Ini adalah rahasia pertama");

  await vault.waitForDeployment();
  const address = await vault.getAddress();

  console.log("Vault dideploy ke:", address);
  console.log("Pemilik Vault adalah:", await vault.owner());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});