//Indicamos la version
pragma solidity >=0.4.4 <0.7.0;

library operaciones {
    function division (uint _a, uint _b) public pure returns(uint){
        require(_b>0, "You can't divide by 0");
        return _a/_b;
    }

    function multiplicacion(uint _i,uint _j) public pure returns(uint){
        if((_j==0) || (_i == 0)){
            return 0;
        } else {
            return _i * _j;
        }
    }
}

contract calculos {
    using operaciones for uint;

    function calculos_operaciones(uint _a, uint _b) public pure returns(uint,uint){
        uint q = _a.division(_b);
        uint m = _b.multiplicacion(_b);
        return (q,m);
    }

}