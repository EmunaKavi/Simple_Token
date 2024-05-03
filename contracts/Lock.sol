// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Lock {
    uint public unlockBlock;
    address payable public owner;

    event Withdrawal(uint amount, uint when);

    constructor(uint _delayBlocks) payable {
        unlockBlock = block.number + _delayBlocks;
        owner = payable(msg.sender);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You aren't the owner");
        _;
    }

    function withdraw() public onlyOwner {
        require(block.number >= unlockBlock, "You can't withdraw yet");
        emit Withdrawal(address(this).balance, block.number);
        owner.transfer(address(this).balance);
    }
}
