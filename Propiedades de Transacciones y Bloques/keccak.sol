pragma solidity >=0.4.4 <0.7.0;
pragma experimental ABIEncoderV2;

contract hash {

    //Computo hash deu n string
    function calcularHash(string memory _cadena) public returns(bytes32){
        return keccak256(abi.encodePacked(_cadena));
    }


    //Computo de hash de varias variables tipo entero,direccion, string
    function calcularHash2(string memory _cadena,uint _k,address _direccion) public returns(bytes32){
        return keccak256(abi.encodePacked(_cadena,_k,_direccion));
    }

    //Computo de hash de string,cadena,una string escrita y un int escrito explicitamente 
    function calcularHash3(string memory _cadena, uint _k, address _direccion) public returns(bytes32){
        return keccak256(abi.encodePacked(_cadena,_k,_direccion,"hola",uint(2)));
    }

    function devolverString(uint _i) public returns(uint){
        _i = _i + 1;
        return(_i);
    }
}
