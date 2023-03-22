// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
 

contract Bank{
    mapping(address => uint) balance;
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    event Deposit(address indexed account ,uint amount);
    event Withdraw(address indexed account ,uint amount);

    modifier onlyOwner{
        require(msg.sender == owner,"Not owner!");
        _;
    }

    receive() external payable{
        balance[msg.sender] += msg.value;
    }

    function getBalance(address account)public view returns(uint256){
        return balance[account];
    }

    function deposit() public payable{
        require(msg.value > 0,"Amount must be greater than zero");
        balance[msg.sender] += msg.value;
        emit Deposit(msg.sender,msg.value);
    }

    function withdraw() public{
        require(balance[msg.sender]>0,"balance is 0");
        uint amount = balance[msg.sender];
        (bool success,) = payable(msg.sender).call{value:amount}("");
        require(success,"Withdraw failed!");
        balance[msg.sender] = 0;
        emit Withdraw(msg.sender,amount);
    }

    function withdrawAll() public onlyOwner{
        uint bank_b = address(this).balance;
        (bool success,) = payable(msg.sender).call{value:bank_b}("");
        require(success,"Withdraw failed!");
        emit Withdraw(msg.sender,bank_b);
    } 
}