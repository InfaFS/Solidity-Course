//Indicar la version
pragma solidity >=0.4.4 <0.7.0;
pragma experimental ABIEncoderV2;

contract mas_variables{
    //Variables de tipo string

    string mi_primer_string;
    string public saludo = "Hola como va?";
    string public string_vacio = "";

    //Variables booleanas 
    bool boolean;
    bool public boolean_inicialized = true;
    bool public flag_false = false;

    //Variables tipo bytes
    bytes32 primer_bytes;
    bytes4 segund_bytes;
    string public nombre = "facundo";
    bytes32 public hash = keccak256(abi.encodePacked(nombre));
    bytes4 identificador;



    function ejemploBytes4() public{
        identificador = msg.sig;
    }

    //Variables address
    address mi_primera_direccion;
    address public direccion_local = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
}