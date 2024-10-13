pragma solidity >=0.4.4 <0.7.0;

contract casteo {
    //Casteo de variables

    uint8 entero_8 = 42;
    uint64 entero_64 = 60000;
    uint entero_256 = 1000000;
    int16 entero_16 = 156;
    int120 entero_120 = 900000;
    int entero = 5000000;

    //Casteando variables
    uint64 public casteo_1 = uint64(entero_8);
    uint64 public casteo_2 = uint64(entero_256);
    uint8 public casteo_3 = uint8(entero_16);
    int public casteo_4 = int(entero_120);

    int public casteo_5 = int(entero_256);

    function convertir(uint8 _k) public view returns (uint64) {
        return uint64(_k);
    }
}
