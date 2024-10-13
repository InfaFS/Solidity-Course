//Version
pragma solidity >=0.4.4 <0.7.0;
pragma experimental ABIEncoderV2;

contract public_private_internal {
    //Modificador public
    uint public variable = 10;
    string public str = "hola pepe";
    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    //Modificador private

    uint private integer= 10;
    bool private flag = true;

    function test(uint _k) public {
        integer = _k;
    }

    //Modificador internal

    bytes32 internal hash = keccak256(abi.encodePacked("hola"));
    
}