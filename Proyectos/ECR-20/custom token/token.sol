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

//Direcciones
//Main --> 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
//2 --> 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
//3 --> 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db

contract ERC20Basic is IERC20{
    string public constant name = "ERC20BlockchainINFA";
    string public constant symbol = "ERFA";
    uint8 public constant decimals = 3;
    

    uint256 totalSupply_;
    
    //Este constructor representa el origen de la criptomoneda
    constructor (uint256 initialSupply){
        totalSupply_ = initialSupply;
        balances[msg.sender] = totalSupply_;
    }

    //Para cada direccion le van a pertencer una cantidad de tokens
    mapping (address => uint) balances;

    //Para direcciones de varias personas, los allowed
    mapping (address => mapping(address => uint)) allowed;

    //Los eventos suceden siempre e indican en la blockchain que se realizo un evento
    //Evento que sucede cada vez que una cantidad de tokens pase de un origen a un destino
    event Transfer(address indexed from, address indexed to,uint256 tokens);
    //Evento que se debe emitir cuando se establece una asginacion con el metodo allowance()
    event Approval(address indexed owner, address indexed spender,uint256 tokens);

    function totalSupply() public override view returns(uint256){
        return totalSupply_;
    }

    function increaseTotalSupply(uint newTokenAmounts) public {
        totalSupply_ +=newTokenAmounts;
        balances[msg.sender] += newTokenAmounts;
    }

    function balanceOf(address tokenOwner) public override view returns (uint256){
        return balances[tokenOwner];
    }

    function allowance(address owner,address spender) external view returns(uint256){
        return allowed[owner][spender];
    }

    function transfer(address recipient, uint256 amount) public override returns(bool){
        require(amount<=balances[msg.sender],"Parece que no tienes esa cantidad de tokens...");
        balances[msg.sender]-=amount;
        balances[recipient]+=amount;
        emit Transfer(msg.sender,recipient,amount);
        return true;
    }

    function approve(address spender, uint256 amount) public override  returns(bool){
        allowed[msg.sender][spender] = amount;
        emit Approval(msg.sender,spender,amount);
        return true;
    }


    //Transferencia no directa, sino que es de alguien delegado
    function transferFrom(address owner, address recipient, uint256 tokens) public override returns(bool){
        require(tokens<=balances[owner],"El propietario no tiene los tokens suficientes");
        require(tokens<=allowed[owner][msg.sender],"No tienes los suficientes tokens");
        
        balances[owner]-=tokens;
        allowed[owner][msg.sender]-= tokens;
        balances[recipient] +=tokens;
        emit Transfer(owner,recipient,tokens);
        return false;
    }
}