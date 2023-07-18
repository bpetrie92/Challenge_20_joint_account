pragma solidity ^0.5.0;

contract JointSavings{
    address payable  accountOne;
    address payable  accountTwo;
    address public LastToWithdraw;
    uint public LastWithdrawAmount;
    uint public contractBalance;

    function withdraw(
        uint amount, address payable recipient
    ) public { require(recipient == accountOne || recipient == accountTwo );
                require(amount <= contractBalance);
    if (LastToWithdraw != recipient) {LastToWithdraw = recipient ;}
    recipient.transfer(amount);
    LastWithdrawAmount = amount;

    contractBalance = address(this).balance; }


    function deposit() public payable{ contractBalance = address(this). balance; }

    function setAccounts(address payable account1, address payable account2) public{ accountOne = account1;
    accountTwo = account2; }
    // receive() external payable { }
    function () external payable {}
}