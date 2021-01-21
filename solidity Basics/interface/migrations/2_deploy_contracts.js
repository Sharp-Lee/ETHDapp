const Counter = artifacts.require("Counter");
const MyContract = artifacts.require("MyContract");
const UniswapExample = artifacts.require("UniswapExample");

module.exports = function (deployer) {
  deployer.deploy(Counter);
  deployer.deploy(MyContract);
  deployer.deploy(UniswapExample);
};
