// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Counter{
    uint256 public counter;
    address owner;
    constructor(uint256 x){
        counter = x;
        owner = msg.sender;
    }
    modifier onlyOwner{
        require(msg.sender == owner,"not owner!");
        _;
    }
    function count(uint x) public onlyOwner view returns(uint){
        return counter+x;
    }

}