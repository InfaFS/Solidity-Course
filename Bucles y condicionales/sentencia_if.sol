//Version
pragma solidity >=0.4.4 <0.7.0;

contract sentencia_if {
    //Numero guardado
    uint numGanador = 0;
    function probarSuerte(uint _numero) public pure returns (bool) {
        if (_numero == numGanador) {
            return true;
        }
        return false;
    }

    function setNumeroGanador(uint _numero) public {
        numGanador = _numero;
    }
}
