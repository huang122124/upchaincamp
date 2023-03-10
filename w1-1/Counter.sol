// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Counter{
    uint256 public counter;
    constructor(uint256 count){
        counter=count;
    }
    function add(uint x) public {
        counter = counter+x;
    }

}