pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT



contract VoteList {
     event VoteList(address addr, uint256 price);
  //0xF87A3B993c1f0b93e9EeB4c9F038f8f7161A8259 votelist contract
   // Max number of whitelisted addresses allowed
    uint8 public maxVotelistedAddresses = 180;

   mapping(address => bool) public votelistedAddresses;

   uint8 public numAddressesVotelisted;

    
  constructor() payable {
  }

    uint256 public price = 0.001 ether;
    function addAddressToVotelist() public payable {
        require(msg.value >= price, "Fund was too small");
        require(!votelistedAddresses[msg.sender], "Sender has already been whitelisted");
        // check if the numAddressesVotelisted < maxVotelistedAddresses, if not then throw an error.
        require(numAddressesVotelisted < maxVotelistedAddresses, "More addresses cant be added, limit reached");
        votelistedAddresses[msg.sender] = true;
        emit VoteList(msg.sender, price);
        price = (price * 101) / 100;
        numAddressesVotelisted += 1;
    }

}