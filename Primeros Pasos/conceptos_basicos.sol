//Indicamos la version
pragma solidity ^0.8.0;

//Importamos el archivo ERC20
import "./ERC20.sol";

//Que hace el contrato
contract PrimerContrato {

    /*
    Guardamos en la variable owner la direccion de la persona que despliega el contrato
    inicializamos el nunero de tokens
    */
    address owner;
    ERC20Basic token;
    constructor() public {
        owner = msg.sender;
        token = new ERC20Basic(1000)
    }
}