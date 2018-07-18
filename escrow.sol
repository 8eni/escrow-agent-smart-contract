pragma solidity ^0.4.23;

contract Escrow {
    
    address chairperson;
    address contractAddress = this;
    
    constructor() public {
        chairperson = msg.sender;
    }
    
    // Modifiers
    modifier chairPersonOnly() {
        if (chairperson != msg.sender) revert();
        _;
    }
    
    // Transactions
    function sendEthToContract() public payable returns(uint) {
        return msg.value;
    }
    
    function sendContractEthToChairperson() public chairPersonOnly returns(uint) {
        chairperson.transfer(contractAddress.balance);
        return chairperson.balance;
    }
    
    // Calls
    function getChairpersonAddress() public constant returns(address) {
        return chairperson;
    }
    
    function getContractBalance() public constant returns(uint) {
        return contractAddress.balance;
    }
}