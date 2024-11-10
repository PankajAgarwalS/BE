// SPDX-License-Identifier:  License
pragma solidity ^0.8.0;

contract Bank {

    address public accHolder;
    uint256 balance = 0;

    constructor(){
        accHolder = msg.sender;
    }

    function withdraw() public payable{
        require(msg.sender == accHolder, "you are not the account owner.");
        require(balance > 0,"Deposit amount should be greater than 0.");
        balance -= msg.value;
    }

    function deposit() public payable {
        require(msg.sender == accHolder, "You are not the account owner."); 
        require(msg.value > 0, "Deposit amount should be greater than 0."); 
        balance += msg.value; 
    }

    function ShowBlance() public view returns (uint256){
        require(msg.sender == accHolder,"you are not the account owner.");
        return balance;
    } 
}


//install metamask
//change to testnet sepolia
//open sepolia faucet and paste wallet address
//in remix deploy tab open environment and select connected wallets
//then deploy
