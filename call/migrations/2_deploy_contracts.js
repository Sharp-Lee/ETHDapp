const Receiver = artifacts.require("Receiver");
const Caller = artifacts.require("Caller");

module.exports = function (deployer) {
  deployer.deploy(Receiver);
  deployer.deploy(Caller);
};
