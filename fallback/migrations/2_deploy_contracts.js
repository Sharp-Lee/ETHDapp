const Fallback = artifacts.require("Fallback");
const SendToFallback = artifacts.require("SendToFallback");

module.exports = function (deployer) {
  deployer.deploy(Fallback);
  deployer.deploy(SendToFallback);
};
