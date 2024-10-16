//Version
pragma solidity >0.4.4 <0.7.0;


contract contratoBucles{
    uint [5] public array_five_uints = [0,1,2,3,4];

    function iterarVector () public {
        uint i;
        for (i=0;i<array_five_uints.length;i++){
            array_five_uints[i] +=1;
        }
    }

    address [] direcciones;

    function asociar() public{
        direcciones.push(msg.sender);
    }

    function comprobarAsociacion() public view returns(bool,address){
        for(uint i=0;i < direcciones.length;i++){
            if(direcciones[i] == msg.sender){
                return (true,direcciones[i]);
            }
        }
    }

    //Suma factorial
    //Factorial n! = 
    function sumaFactorial(uint _n) public pure returns(uint){
        uint result=1;
        for(uint _i = 1;_i<=_n;_i++){
            result = result * _i;
        }

        return result;
    }
}