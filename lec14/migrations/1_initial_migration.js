// const Migrations = artifacts.require("Migrations");
const Migrations = artifacts.require("./Lecture14.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
};
