// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MultiSend{
    //address of owner
    address private owner;

    //event to change owner of contract
    event OwnerChange(address indexed oldOwner,address indexed newOwner); 
     
    //total value of ether in contract
    uint256 private total_value;

    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }

    constructor() payable {
        owner = msg.sender;
        emit OwnerChange(address(0), owner);
        total_value = msg.value;
    }

    //change owner
    function changeOwner(address newOwner) public onlyOwner{
        emit OwnerChange(owner, newOwner);
        owner = newOwner;
    }

    //enable owner to store ether in smart contract
    function storeEther() payable public onlyOwner{
        total_value += msg.value;
    }

    //add all elements of array and return its sum
    function sum(uint [] memory amounts) private pure returns (uint){
        uint total_amount = 0;

        for(uint i = 0;i < amounts.length;i++){
            total_amount += amounts[i];
        }

        return total_amount;
    }

    //send ether function
    function sendEther(address payable recieverAddr,uint amount) private{
        recieverAddr.transfer(amount);
    }

    //send ether to many addresses
    function sendMany(address payable [] memory addrs,uint [] memory amnts) payable public onlyOwner{
        total_value += msg.value;

        require(addrs.length == amnts.length,"the length of all arrays should be the same");

        uint total_amount = sum(amnts);
        
        require(total_value >= total_amount,"the total amount should be more or equal to");

        for(uint i = 0;i < addrs.length;i++){
            total_value -= amnts[i];
            sendEther(addrs[i], amnts[i]);
        }

    }

    //getter functions
    function getOwner() external view returns (address){
        return owner;
    }

    function getSendEther(address payable recieverAddr,uint amount) external  returns (bool success){
        sendEther(recieverAddr,amount);
        return success;
    }

    function getTotalValue() external view returns (uint256){
       return total_value;
    }
    
}