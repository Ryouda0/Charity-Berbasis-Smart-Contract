import hre from "hardhat";

async function main() {
  console.log("Mendeploy kontrak Charity...");
  
  const Charity = await hre.ethers.getContractFactory("Charity");
  
  // Parameter: target 5 ETH, durasi 30 hari
  const targetEth = 5; // 5 ETH
  const durationDays = 30; // 30 hari
  
  console.log(`📊 Parameter:`);
  console.log(`   - Target: ${targetEth} ETH`);
  console.log(`   - Durasi: ${durationDays} hari`);
  
  const charity = await Charity.deploy(targetEth, durationDays);
  
  await charity.waitForDeployment();
  const address = await charity.getAddress();
  
  console.log("\n✅ KONTRAK BERHASIL DIPASANG!");
  console.log("=================================");
  console.log("📌 Alamat Kontrak:", address);
  console.log("=================================");
  
  // Verifikasi semua fungsi
  const target = await charity.targetAmount();
  console.log("🎯 Target donasi:", hre.ethers.formatEther(target), "ETH");
  
  const deadline = await charity.deadline();
  const deadlineDate = new Date(Number(deadline) * 1000);
  console.log("⏰ Deadline:", deadlineDate.toLocaleString());
  
  const balance = await charity.getContractBalance();
  console.log("💰 Saldo awal:", hre.ethers.formatEther(balance), "ETH");
  
  const owner = await charity.owner();
  console.log("👤 Owner:", owner);
  
  console.log("\n📝 COPY ALAMAT INI KE index.html:");
  console.log(`const contractAddress = "${address}";`);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });