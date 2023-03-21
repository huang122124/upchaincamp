require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */

// Go to https://infura.io, sign up, create a new API key
// in its dashboard, and replace "KEY" with it
const INFURA_API_KEY = "3b8a4ff7ba6240e7b42be7f38d44e346";
const ALCHEMY_API_KEY = "yT2UNeJx9_WppYqNjIUAW_q9YvFvSRuV";

//钱包prv key
const SEPOLIA_PRIVATE_KEY = "9d3a93a0fe5716bd058119b8c971342aec5170568ac6525fa71fb9355a5e47d7";

module.exports = {
  solidity: "0.8.18",
  etherscan: {
    apiKey: "M2J52SCD1GJ4633TZ495MDRPIMPVYZZWF6",
  },
  networks: {
    sepolia: {
      url: `https://sepolia.infura.io/v3/${INFURA_API_KEY}`,
      accounts: [SEPOLIA_PRIVATE_KEY],
    },
  },
};
