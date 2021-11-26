require("@nomiclabs/hardhat-waffle");

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */

require("@nomiclabs/hardhat-ethers")

module.exports = {
  defaultNetwork: "rinkeby",
  networks: {
    hardhat: {
    },
    rinkeby: {
      url: "https://polygon-mumbai.g.alchemy.com/v2/849e0ApT0Je9wgVR-JF4yIa0nJVYOFa_",
      accounts: ["67b277b9573fd3821c550585fa866c56b4b3e1117e716622645d5fa0d7898594"]
    }
  },
  solidity: {
      compilers: [
        {
          version: "0.8.4"
        },
        {
          version: "0.4.21"
        },
      
      ]
    },
  paths: {
    sources: "./contracts",
    tests: "./test",
    cache: "./cache",
    artifacts: "./artifacts"
  },
  mocha: {
    timeout: 20000
  }
};

// module.exports = {
//   solidity: "0.8.4",
//   solidity: "0.4.21",
// };
