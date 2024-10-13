//Indicamos la version
pragma solidity >=0.4.4 < 0.7.0;

contract Arrays{
    //Array de longitud fija de 5 posiciones
    uint[5] public array_5 =[1,2,3];

    //Array de enteros 32 bits 7 pos
    uint32[7] array_32;

    //Array de strings
    string[5] array_strings;

    uint [] public array_dinamico;

    struct Persona{
        string nombre;
        uint edad;
    }

    //Array dinamico de tipo Persona
    Persona [] public array_personas;

    function modificarArray(uint _numero) public{
        array_dinamico.push(_numero);
    }

    function modificarArrayPersonas(string memory _nom,uint _edad) public {
        array_personas.push(Persona(_nom,_edad));
    }

    function modificarArrayPersonasEspecifico(uint _pos,string memory _nom,uint _edad) public {
        array_personas[_pos] = Persona(_nom,_edad);
    }

}