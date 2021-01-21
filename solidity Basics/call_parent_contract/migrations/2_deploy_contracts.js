const A = artifacts.require("A");
const B = artifacts.require("B");
const C = artifacts.require("C");
const D = artifacts.require("D");

module.exports = function(deployer) {
    deployer.deploy(A);
    deployer.deploy(B);
    deployer.deploy(C);
    deployer.deploy(D);
};
