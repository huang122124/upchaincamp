const { expect } = require("chai");
const hre = require("hardhat");

describe("Counter",function(){
    it("部署者成功调用count()",async function () {
        const Counter = await hre.ethers.getContractFactory("Counter");
        const counter = await Counter.deploy(3);
        // assert that the value is correct
        expect(await counter.count(2)).to.equal(5);
    })

    it("Should revert with the right error if called from another account", async function () {
        // ...deploy the contract...
        const Counter = await hre.ethers.getContractFactory("Counter");
        const counter = await Counter.deploy(3);

        const [owner, otherAccount] = await hre.ethers.getSigners();
        console.log("Owner address:"+owner.address);
        console.log("otherAccount address:"+ otherAccount.address);
        
        
        await expect(counter.connect(otherAccount).count(2)).to.be.revertedWith(
          "not owner!"
        );
      });
})