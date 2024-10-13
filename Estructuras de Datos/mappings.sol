pragma solidity >=0.4.4 <0.7.0;
pragma experimental ABIEncoderV2;

contract Mappings{
    //Declarar un mapping para elegir un numero
    mapping (address => uint) public elegirNumero;

    function elegirNumeroFunction(uint _numero) public{
        elegirNumero[msg.sender] = _numero;
    }

    function consultarNumero() public view returns(uint){
        return elegirNumero[msg.sender];
    }

    //Declaramos un mapping que relaciona nombre de alguien con cantidad de dinero
    mapping (string => uint) cantidadDinero;

    function Dinero(string memory _nombre, uint _cantidad) public {
        cantidadDinero[_nombre] = _cantidad;
    }

    //podemos usar una funcion que declaremos o directamente el get que ya tiene el mapping si le ponemos public
    
    function consultarDinero(string memory _nombre) public view returns(uint){
        return cantidadDinero[_nombre];
    }

    //tambien pueden ser de structs/tipos de datos complejos
    struct Persona{
        string nombre;
        uint edad;
    }

    mapping (uint => Persona) infoPersona;

    //funcion para cargar los datos
    function cargarPersona(string memory _nombre,uint _edad,uint _id) public {
        Persona memory newPersona;
        newPersona.nombre = _nombre;
        newPersona.edad = _edad;
        infoPersona[_id] = (newPersona);

    }

    function consultarPersona(uint _id) public view returns(Persona memory){
        return infoPersona[_id];
    }

}