//Indicamos la version
pragma solidity >=0.4.4 <0.7.0;
pragma experimental ABIEncoderV2;

contract view_pure_payable{
    //Modificador de view 
    string[] lista_alumnos;

    function nuevoAlumno(string memory _nombre) public {
        lista_alumnos.push(_nombre);
    }

    //vamos a acceder a los datos, pero no los modificamos, en este caso
    //vamos a acceer a la variable lista_alumnos que esta guardada en el storage del contrato

    function ver_alumno(uint _pos) public view returns(string memory) {
        return lista_alumnos[_pos];
    }

    uint x=10;
    function sumarAx(uint _a) public view returns(uint){
        return x+_a;
    }

    //Modificador de pure, no va a acceder a los datos y solo va a acceder a los parametros que recibe 
    function sumaPure(uint _a, uint _b) public pure returns(uint){
        return _a+_b;
    }

    //Modificador de payable

    mapping (address => cartera) DineroCartera;

    struct cartera{
        string propietario;
        address direccion_persona;
        uint dinero_persona;
    }

    function Pagar(string memory _nombrePersona,uint _cantidad) public payable{
        cartera memory mi_cartera; //memory para que cuando s termine la funcion se elimine de la memoria
        mi_cartera = cartera(_nombrePersona,msg.sender,_cantidad);
        DineroCartera[msg.sender] = mi_cartera;
    }

    function verSaldo() public view returns(cartera memory){
        return DineroCartera[msg.sender];
    }

    
}