// contract address 0x09d68286874f5e5C74f7229127d125F8e40E0494



pragma solidity ^0.5.0;

contract Bank {
    
    struct balance{
    uint256 amount ;
    uint256 totalAmount;
    }

    address payable private addr;

    mapping (address => balance)  private accountNumber;
    event display(address, uint256);
    
    constructor () public{
        accountNumber[addr].amount = 0;
        accountNumber[addr].totalAmount = 0;
    }
    
    function amountToDeposit () public payable {
        addr = msg.sender ;
        accountNumber[addr].amount = msg.value ;
        accountNumber[addr].totalAmount = accountNumber[addr].totalAmount + accountNumber[addr].amount;
        emit display(msg.sender, accountNumber[addr].totalAmount);
    }
    
    function amountToWithdraw (uint256 _amount) public payable {
        accountNumber[addr].amount = _amount * 1 ether ;
        addr = msg.sender ;
        require(accountNumber[addr].totalAmount > accountNumber[addr].amount, "Your balance is low" );       //using revert to check the account having enough balance
        assert((accountNumber[addr].totalAmount-accountNumber[addr].amount) >= 1 ether);                      //using assert to maintain low balance 
        addr.transfer(accountNumber[addr].amount);
        emit display(addr, accountNumber[addr].totalAmount);
        accountNumber[addr].totalAmount = accountNumber[addr].totalAmount-accountNumber[addr].amount;
    }
    
    function showBalance() public view returns(uint256){
        return accountNumber[msg.sender].totalAmount/1 ether;
    }
    
    function moneyTransferEther (address payable _receiverAddr, uint256 _amount) payable public{                 //Money transfered from contract Bank account to EOA directly 
        addr = msg.sender;
        accountNumber[addr].amount = _amount;
        assert(accountNumber[addr].totalAmount > _amount);
        _receiverAddr.transfer(accountNumber[addr].amount*1 ether);
        accountNumber[addr].totalAmount = accountNumber[addr].totalAmount-accountNumber[addr].amount;
    }
    
}
