// SPDX-License-Identifier: CC0-1.0
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

//Interface para el token ERC20

interface IERC20{
    //Devuelve la cantidad de tokens que hay en existencia, es una funcion de seguridad
    function totalSupply() external view returns(uint256); //Extneral solo indica que sera programada fuera de la interface

    //Devuelve la cantidad de tokens para una direccion indicada por parametro
    function balanceOf(address account) external view returns (uint256);

    //Devuelve el numero de tokens que el spender podra gastar en nombre del propietario
    function allowance(address owner,address spender) external view returns(uint256);

    //Devuelve un valor booleano resultado de la operacion indicada
    function transfer(address recipient, uint256 amount) external returns(bool);

    //Devuelve un valor booleano con el resultado de la operacion de gastos
    function approve(address spender, uint256 amount) external returns(bool);

    //Devuelve un valor booleano con el resultado de la operacion de paso de una cantidad de tokens usando el metodo allowance()
    function transferFrom(address sender, address recipient, uint256 tokens) external returns(bool);
}

contract ERC20Basic is IERC20{

    function totalSupply() public override view returns(uint256){
        return 0;
    }

    function balanceOf(address account) public override view returns (uint256){
        return 0;
    }

    function allowance(address owner,address spender) external view returns(uint256){
        return 0;
    }

    function transfer(address recipient, uint256 amount) public override view returns(bool){
        return false;
    }

    function approve(address spender, uint256 amount) public override  returns(bool){
        return false;
    }

    function transferFrom(address sender, address recipient, uint256 tokens) public override returns(bool){
        return false;
    }
}