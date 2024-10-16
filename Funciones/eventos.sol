pragma solidity >=0.4.4 <0.7.0;

contract Eventos {
    //Declaramos los eventos a utilizar

    event evento_1(string _nombrePersona);

    event evento_2(string _nombrePersona, uint _edadPersona);

    event evento3(string, uint, address, bytes32);

    event abortarMision();

    function EmitirEvento1(string memory _nombrePersona) public {
        emit evento_1(_nombrePersona);
    }

    function EmitirEvento2(string memory _nombrePersona, uint _edad) public {
        emit evento_2(_nombrePersona, _edad);
    }

    function EmitirEvento3(string memory _nombrePersona, uint _edad) public {
        bytes32 hash_id = keccak256(
            abi.encodePacked(_nombrePersona, _edad, msg.sender)
        );
        emit evento3(_nombrePersona, _edad, msg.sender, hash_id);
    }

    function AbortarMision() public {
        emit abortarMision();
    }
}
