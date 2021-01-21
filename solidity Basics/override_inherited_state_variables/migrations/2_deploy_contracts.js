const A = artifacts.require("A");
const C = artifacts.require("C");

module.exports = function(deployer) {
  deployer.deploy(A);
  deployer.deploy(C);
};
