const { expect } = require("chai");

describe("DonateContract contract", function () {
  it("Deployment should assign the total supply of donations to the owner", async function () {
    const [owner] = await ethers.getSigners();

    const DonateContract = await ethers.getContractFactory("Donation");

    const sDonation = await Donation.deploy();

    const ownerDonation = await sDonation.withdrawToken(owner.address);
    expect(await sDonation.Donations()).to.equal(ownerBalance);
  });
});
