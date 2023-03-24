// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
 
 contract Score{
    mapping(address => uint)public score;
    address owner;
    
    constructor(){
        owner = msg.sender;
    }
    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }
    function setTeacher(address new_teacher)public onlyOwner{
        owner = new_teacher;
    }

    function setScore(address student,uint data) public onlyOwner{
        require(data<=100,"Score over than 100!");
        score[student] = data;
    }

 }


interface IScore {
    function setScore(address,uint) external;
}
contract Teacher {
    IScore score;

    constructor(address s){
        score = IScore(s);
    }

    function setScore(address student,uint data) public{
        require(data<=100,"Score over than 100!");
        score.setScore(student,data);
    }
}