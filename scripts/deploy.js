async function main() {
  // We get the contract to deploy
  const Verse = await ethers.getContractFactory("TokenRecipient");
  // const ver = await Verse.deploy(100000000000, "Verse", 2, "VER");

}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });