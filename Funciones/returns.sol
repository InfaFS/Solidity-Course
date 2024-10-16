//Indicamos la version
pragma solidity >=0.4.4 <0.7.0;
pragma experimental ABIEncoderV2;

contract ValoresDeRetorno {
    //Funcion que devuelve un saludo personalizado
    function saludos(string memory _nombre) public returns (string memory) {
        string memory cadena_inicial = "saludos y bienvenido, ";
        return string(abi.encodePacked(cadena_inicial,_nombre));
    }

    //Esta funcion calcula el resultado de una multiplicacion de dos numeros enteros
    function multiplicar(uint _a,uint _b) public returns(uint){
        return _a * _b;
    } 

    //True si es par, false caso contrario
    function par_impar(uint _x) public returns(bool){
        if((_x % 2) == 0){
            return true;
        } else {
            return false;
        }
    }
    
    //Devuelve el resto, el cociente y si es multiplo o no, lo cual lo obtiene si el resto es 0
    function division(uint _a, uint _b) public returns(uint,uint,bool){
        uint q = _a / _b;
        uint r = _a % _b;
        bool multiplo=false;
        if(r==0){
            multiplo=true;
        }

        return(q,r,multiplo);
    }

    //Manejo de los valores devueltos de una funcion


    function numeros() public returns(uint,uint,uint,uint,uint){
        return (1,2,3,4,5);
    }


    uint [] public array;
    uint public variable_ultimo;
    //Asignacion multiple
    function guardar_valores() public {
        uint a;
        uint b;
        uint c;
        uint d;
        uint e;
        (a,b,c,d,e) = numeros();
        array.push(a);
        array.push(b);
        array.push(c);
        array.push(d);
        array.push(e);
    }

    function ultimoValor() public{
        uint ultimo_valor;
        (,,,,ultimo_valor) = numeros();
        variable_ultimo = ultimo_valor;

    }
}
