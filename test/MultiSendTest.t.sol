//SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

import {Test,console} from 'forge-std/Test.sol';
import {MultiSend} from '../src/MultiSend.sol';
import {DeployMultiSend} from '../script/DeployMultiSend.s.sol';

contract MultiSendTest is Test{
    MultiSend  multiSend;

    

    function setUp() external{
        DeployMultiSend deployer = new DeployMultiSend();
        multiSend = deployer.run();
    }

    // Test contract initialization
    function testInit() public {
        assertEq(multiSend.getOwner(), msg.sender, "The contract should be initialized with the deployer as the owner.");
    }

      // Test changeOwner function
    function testChangeOwner() public{
        address newOwner = 0xa0Ee7A142d267C1f36714E4a8F75612F20a79720;
        vm.prank(msg.sender);
        multiSend.changeOwner(newOwner);
        assertEq(multiSend.getOwner(),newOwner);
    }
    
    //test storeEther
    function testStoreEther() public{
        uint256 initialTotalValue = multiSend.getTotalValue();
        vm.prank(msg.sender);
        multiSend.storeEther();
        uint256 updatedTotalValue = multiSend.getTotalValue();
        assertEq(initialTotalValue,updatedTotalValue);
    }

    //test send Ether
    function testSendEtherMany() public {
        address payable[] memory addresses = new address payable[](2);
        addresses[0] = payable(address(0x976EA74026E726554dB657fA54763abd0C3a0aa9));
        addresses[1] = payable(address(0x9965507D1a55bcC2695C58ba16FB37d819B0A4dc));

        uint [] memory amounts = new uint [](2);
        amounts[0] = 0.1 ether;
        amounts[1] = 0.1 ether;

        uint256 initialBalance = address(this).balance;
        vm.prank(msg.sender);

        multiSend.sendMany(addresses,amounts);

        uint256 updatedBalance = address(this).balance;
        assertEq(updatedBalance,initialBalance);
    }
  
}