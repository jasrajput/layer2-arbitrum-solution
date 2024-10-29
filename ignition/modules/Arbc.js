const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");
const ArbcModule = buildModule("StakingModule", (m) => {
    const contract = m.contract("Staking", [
        '0x7ef95a0fee0dd31b22626fa2e10ee6a223f8a684',
        '0x7Ac2683b2F5A6f55432728493d27845e8ea60182',
        '0x7Ac2683b2F5A6f55432728493d27845e8ea60182'
    ]);
  
    return { contract };
  });
  
  module.exports = ArbcModule;