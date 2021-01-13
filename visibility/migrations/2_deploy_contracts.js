const Base = artifacts.require("Base");
const Child = artifacts.require("Child");

module.exports = function(deployer) {
    deployer.deploy(Base);
    deployer.deploy(Child);
};