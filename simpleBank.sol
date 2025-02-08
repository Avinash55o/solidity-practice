// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract SimpleBank {
   // maps the addresses to the balances
    mapping(address => uint256) public balances;
  // event deposite
    event Deposited(address indexed user, uint256 amount);
   // event withdrawn 
    event Withdrawn(address indexed user, uint256 amount);

    // Deposit function
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        balances[msg.sender] += msg.value;
        emit Deposited(msg.sender, msg.value);
    }

    // Withdraw function
    function withdraw(uint256 _amount) public {
        require(_amount > 0, "Withdraw amount must be greater than zero");
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        
        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
        
        emit Withdrawn(msg.sender, _amount);
    }

    // Check balance function
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
