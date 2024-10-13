//Indicar la version
pragma solidity >=0.4.4 <0.7.0;

contract EjemploDeEnumeraciones {

    //Enumeracion de interruptor

    enum estado {OFF,ON}

    //Variable de tipo enum

    estado public state;

    function encender() public {
        state = estado.ON;
    }

    function apagar() public {
        state = estado.OFF;
    }

    function fijarEstado(uint _k) public {
        state = estado(_k);
    }

    function EstadoActual() public view returns(estado){
        return state;
    }

    //Enumeracion de direcciones
    enum direcciones {UP,DOWN,RIGHT,LEFT_puaj}

    //Declaramos variable de tipo enum pero direcciones
    
    direcciones direccion;

    function up() public {
        direccion = direcciones.UP;
    }

    function down() public {
        direccion = direcciones.DOWN;
    }

    function right() public {
        direccion = direcciones.RIGHT;
    }

    function left() public {
        direccion = direcciones.LEFT_puaj;
    }
 
    function EstadoDireccion() public view returns(direcciones){
        return direccion;
    }
}