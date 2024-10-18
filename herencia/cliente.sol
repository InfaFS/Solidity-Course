//Version
pragma solidity >=0.4.4 <0.7.0;

//import "./herencias.sol";

import {Banco,Banco2,Banco3} from "./herencias.sol";

contract Cliente is Banco{

    function AltaCliente  (string memory _nombre) public {
        nuevoCliente(_nombre);
    }

    function ingresarDinero(string memory _nombre,uint _cantidad) public {
        clientes[_nombre].dinero += _cantidad;
    }

    function retirarDinero(string memory _nombre, uint _cantidad) public returns(bool){
        bool flag = true;
        if(int(clientes[_nombre].dinero) - int(_cantidad) >= 0){
            clientes[_nombre].dinero -=_cantidad;
        } else {
            flag = false;
        }
        return flag;
    }

    function consultarDinero(string memory _cliente) public view returns(uint){
        return clientes[_cliente].dinero;
    }
}