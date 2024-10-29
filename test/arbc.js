const {expect} = require('chai');

describe('Constructor initialization', function() {
    it('Check if default refer same as owner', async function() {
        const [owner] = await ethers.getSigners();
        const contract = await ethers.deployContract('ARBC', [
            '0x7ef95a0fee0dd31b22626fa2e10ee6a223f8a684',
            '0x7ef95a0fee0dd31b22626fa2e10ee6a223f8a684',
            '0x7ef95a0fee0dd31b22626fa2e10ee6a223f8a684',
            '0x7Ac2683b2F5A6f55432728493d27845e8ea60182',
            '0x7Ac2683b2F5A6f55432728493d27845e8ea60182',
        ]);

        const defaultRefer = await contract.defaultRefer();
        expect(defaultRefer).to.equal(owner);
    });
})