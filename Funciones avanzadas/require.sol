pragma solidity >=0.4.4 < 0.7.0;
pragma experimental ABIEncoderV2;

contract Require{
    //Funcion para verificar que una contra se igual a otra
    string password = "P4SSW0RD";
    function passwordComparer(string memory _pass) public view returns(string memory){
        require( keccak256(abi.encodePacked(_pass)) == keccak256(abi.encodePacked(password)), "Try again");
        return "Pass!";
    }

}