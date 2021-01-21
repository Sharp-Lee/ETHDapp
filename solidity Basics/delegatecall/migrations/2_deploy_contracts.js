const B = artifacts.require("B");
const A = artifacts.require("A");

module.exports = function (deployer) {
  deployer.deploy(B);
  deployer.deploy(A);
};
