var movie = artifacts.require("./MovieSale.sol");


module.exports = function(deployer) {
  deployer.deploy(movie);
};
