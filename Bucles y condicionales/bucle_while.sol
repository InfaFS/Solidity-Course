//Version
pragma solidity >=0.4.4 < 0.7.0;

contract bucle_while{

    //Suma del os numeros impares menores o iguales a 100
    function suma_imapres() public pure returns(uint){
        uint suma=0;
        uint contador=1;

        while(contador <= 4){
            if(contador % 2 != 0){
                suma+=contador;
            }
            contador++;
        }

        return suma;
    }

    //Esperar 10 segundos 

    uint tiempo;

    function fijarTiempo() public{
        tiempo = now;
    }

    function espera() public view returns(bool){
        while(now<tiempo + 10 seconds){
            return false;
        }
        return true;
    }
    
    //Siguiente numero primo
     function siguientePrimo(uint _p) public pure returns (uint) {
        uint primo_siguiente = _p + 1;

        // Iteramos hasta encontrar un primo
        while (!esPrimo(primo_siguiente)) {
            primo_siguiente++;  // Incrementamos para buscar el siguiente
        }

        return primo_siguiente;  // Retornamos el primer número primo encontrado
    }

    function esPrimo(uint _n) internal pure returns (bool) {
        if (_n < 2) {
            return false;  // Los números menores que 2 no son primos
        }
        
        uint i = 2;  // Empezamos a probar divisores desde 2
        // Verificamos si el número tiene algún divisor
        while (i * i <= _n) {
            if (_n % i == 0) {
                return false;  // Si tiene divisor, no es primo
            }
            i++;
        }

        return true;  // Si no tiene divisores, es primo
    }
}