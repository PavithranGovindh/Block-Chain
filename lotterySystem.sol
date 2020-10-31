pragma solidity >=0.5.13 <0.7.3;

contract lotterySystem{
    
    address public owner;
    mapping (address => uint) addressOfLotteryParticipant;
    address[] addressOfParticipant;
    
    constructor () public {
        owner = msg.sender;
    }
    
    event displayWinner(address);
    
    function receiveEtherForParticipation() payable public {
        require (msg.value >= 1 ether , "Minimum 1 Ether required");
        require(contains(msg.sender)==0,"Already Entered");
        addressOfLotteryParticipant[msg.sender]=msg.value;
        addressOfParticipant.push(msg.sender);
    }
    
    function randomNumberFunction() private view onlyOwner returns (uint){
        uint randomNumber = uint (keccak256(abi.encodePacked(block.difficulty,block.timestamp,
           msg.sender,addressOfParticipant))) % addressOfParticipant.length;
        return(randomNumber);
    }
    
    function transferEtherToWinner() public onlyOwner{
        uint randomWinner = randomNumberFunction();
        address payable winner = payable (addressOfParticipant[randomWinner]);
        winner.transfer(address(this).balance);
        emit displayWinner(addressOfParticipant[randomWinner]);
        resetSmartContract();
    }
    
    function resetSmartContract() private onlyOwner {
        
        for(uint8 i = 0;i < addressOfParticipant.length; i++){
            addressOfLotteryParticipant[addressOfParticipant[i]] = 0;
        }
    }
    
    modifier onlyOwner() {
        require(msg.sender ==owner ,"Owner only have the permission");
        _;
    }
    
    function contains (address _addr) private view returns (uint){
        return addressOfLotteryParticipant[_addr];
    }
    
    
}
