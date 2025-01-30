// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.7; // define the version u use

// declaration of the contract
contract structure{
    uint256 myNum; //state variable uint
    uint256 myNumber=22;
    string mytext="yoho"; //state variable string
    bool apple=true; // boolean state variabel

    // dive to function part
    function set(uint256 _num) public{ //to set the no
        myNum= _num;
    
    }

    function getNUMBER() public view returns(uint256){ //to get the no that we have set
        return myNum;
    }

    function getstring() public view returns (string memory) { //get the string
        return mytext;
        }

}