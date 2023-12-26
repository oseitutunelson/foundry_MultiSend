//SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

import {Script} from 'forge-std/Script.sol';
import {MultiSend} from '../src/MultiSend.sol';

contract DeployMultiSend is Script{
    function run() external returns (MultiSend){
        vm.startBroadcast();
        MultiSend multiSend = new MultiSend{value:5 ether}();
        vm.stopBroadcast();

        return multiSend;
    }
}