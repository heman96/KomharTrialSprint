pragma solidity ^0.4.0;


//Contract that is first deployed.
contract calledContract{
    uint number = 42;
    function getNumber() constant returns(uint){
        return number;
    }
}
