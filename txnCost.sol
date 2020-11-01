//contractAddr: 0xD7ACd2a9FD159E69Bb102A1ca21C9a3e3A5F771B

pragma solidity >=0.5.3 <0.7.3;

contract txnCost{
    
    int8 paperMoney;
    int256 noOfGifts;
    
    constructor () public {
        paperMoney = 0;
        noOfGifts =0;
    }
    
    function moneyToSent(int8 _paperMoney) public {
        paperMoney =_paperMoney;
    }
    
    function requiredGifts(int256 _noOfGifts) public{
        noOfGifts = _noOfGifts;
    }
}
