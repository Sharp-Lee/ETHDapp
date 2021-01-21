const Car = artifacts.require("Car");
const CarFactory = artifacts.require("CarFactory");

module.exports = function (deployer) {
  //deployer.deploy(Car);
  deployer.deploy(CarFactory);
};
