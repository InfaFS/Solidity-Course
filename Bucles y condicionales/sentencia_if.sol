//Version
pragma solidity >=0.4.4 <0.7.0;

contract sentencia_if {
    //Numero guardado
    uint numGanador = 0;
    function probarSuerte(uint _numero) public view returns (bool) {
        if (_numero == numGanador) {
            return true;
        }
        return false;
    }

    function setNumeroGanador(uint _numero) public {
        numGanador = _numero;
    }

    function valorAbsoluto(int _k) public pure returns(uint){
        uint valor_absoluto_numero;
        if(_k<0){
            valor_absoluto_numero = uint(-_k);
        } else {
            valor_absoluto_numero = uint(_k);
        }

        return valor_absoluto_numero;
    }
    
    //Votacion
    //Tres candidatos: Facundo,Juti,Jose

    function votar(string memory _candidato) public pure returns(string memory){
        string memory mensaje;
        
        if (keccak256(abi.encodePacked(_candidato)) == keccak256(abi.encodePacked("Facundo"))){
            mensaje = "Facundo votado correctamente";
        } else if (keccak256(abi.encodePacked(_candidato)) == keccak256(abi.encodePacked("Juti"))) {
            mensaje = "Juti votada correctamente";
        } else if (keccak256(abi.encodePacked(_candidato)) == keccak256(abi.encodePacked("Jose"))) {
            mensaje = "Jose votado correctamente";
        } else {
            mensaje = "Esa persona no esta disponible para votar";
        }
        return mensaje;
    }
}
