pragma solidity >=0.4.4 <0.7.0;

contract Banco{

    //Definimos un tipo de dato complejo
    struct cliente{
        string _nombre;
        address direccion;
        uint dinero;
    }

    //Mapping que relaciona nombre de cliete con un cliente
    mapping (string => cliente) clientes;

    //Funcion que da de alta un nuevo cliente

    function nuevoCliente(string memory _nombre) public {
        clientes[_nombre] = cliente(_nombre,msg.sender,0);
    }
}

contract Banco2{

} 

contract Banco3{
    
}