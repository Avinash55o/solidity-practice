// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract GasExample{ //more the complexity more will be the gas
    uint256 num;
     
     function getNumber() public view returns(uint256){// only read from the storage so low gas
        return num;
     }

    function setNum(uint256 Num)public{ //changes in the storage so higher gas
        num= Num;
    }

    function expensiveFunction() public { // more higer gas use
        for (uint256 i = 0; i < 100; i++) {
            num += i; // Modifies storage multiple times
        }
    }
}