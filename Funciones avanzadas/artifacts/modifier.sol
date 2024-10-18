//Version

pragma solidity >=0.4.4 <0.7.0;

contract Modifier{

    address public owner;

    constructor() public{
        owner = msg.sender;
    }

    modifier soloPropietario(){
        require(msg.sender==owner,"No tienes permisos para ejecutar la funcion");
        _;
    }

    function ejemplo1() public soloPropietario(){
        //Algo
    }

    struct Cliente{
        address direccion;
        string nombre;
    }

    mapping(string => Cliente) clientes;

    function altaCliente(string memory _nombre) public {
        clientes[_nombre] = Cliente(msg.sender,_nombre);
    }

    modifier soloCliente(string memory _nombre){
        require(clientes[_nombre].direccion == msg.sender,"No coincide el nombre con un Cliente asociado");
        _;
    }

    function ejemplo2(string memory _nombre) public view soloCliente(_nombre) returns(bool){
        return true;
    } 

}