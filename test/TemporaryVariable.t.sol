// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "src/TemporaryVariable.sol";


contract testTemporaryVariable is Test, TemporaryVariable {    
    TemporaryVariable _TemporaryVariable;
    address user1 = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address user2 = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    function setUp() public {
         vm.prank(owner);
        _TemporaryVariable = new TemporaryVariable();

        vm.deal (user1 , 100);
        vm.deal (user2 , 100);

        vm.prank(user1);
        _TemporaryVariable.supply(user1, 100);
        vm.prank(user2);
        _TemporaryVariable.supply(user2, 100);
    }

    function testContract() public {
        uint _amount = 100;

        vm.prank(user2);
        _TemporaryVariable.transfer(user2, user1, _amount);

        vm.prank(user1);
        uint256 newbalance = _TemporaryVariable.checkbalance(user1);
        assertEq(newbalance, 200);
    }
}