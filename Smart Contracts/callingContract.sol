pragma solidity ^0.4.0;
//callerContract retrieves data from the already deployed callingContract.
contract callerContract{
    calledContract toBeCalled = calledContract( 0x16d4d0cfd7b518c41c5925dbe2d44727d11bb162);
    
    function getNumber() constant returns(uint){
        return toBeCalled.getNumber();
    }
}

contract calledContract{
    uint number = 42;
    function getNumber() constant returns(uint){
        return number;
    }
}
