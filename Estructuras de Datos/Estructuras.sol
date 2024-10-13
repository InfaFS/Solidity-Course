//Version
pragma solidity >=0.4.4 < 0.7.0;

contract Estructuras{
    //Cliente de una pagina web
    struct cliente{
        uint id;
        string name;
        string dni;
        string mail;
        uint phone_number;
        uint credit_number;
        uint secret_number;

    }

    //Creacion de la variable
    cliente cliente_1 = cliente(1,"Facundo","123456","aaa@gmail.com",12345678,1234,11);

    //Producto de una pagina web
    struct producto{
        string nombre;
        uint precio;
    }

    //ONG
    struct ONG{
        address ong;
        string nombre;

    }

    struct Causa{
        uint id;
        string nombre;
        uint precio_objetivo;
    }


}