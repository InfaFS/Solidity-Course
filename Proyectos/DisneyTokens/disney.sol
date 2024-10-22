// SPDX-License-Identifier: CC0-1.0
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;
import "./ERC20.sol";

contract Disney{

    //------- DECLARACIONES INICIALES --------//
    ERC20Basic private token;

    //Direccion de disney;
    address payable public owner;

    constructor () public {
        token = new ERC20Basic(10000);
        owner = payable(msg.sender);
    }

    //Estructura para almacenar a los clientes de Disney
    struct cliente{
        uint tokens_comprados;
        string [] atracciones_disfrutadas;
    }

    //Mapping para el registro de clientes
    mapping (address => cliente) public Clientes;

    //------- GESTION DE TOKENS --------//

    //Funcion para establecer el precio de un Token
    function PrecioTokens(uint _numTokens) internal pure returns(uint){
        //Conversion de tokens a Ethers: 1 Token -> 1 ether
        return _numTokens*(1 ether);
    }

    function CompraTokens(uint _numTokens) public payable{
        // Establecer el precio de los tokens
        uint coste = PrecioTokens(_numTokens);
        //Evalua con msg.value si el dinero que se ingreso es valido al precio de tokens
        require(msg.value >= coste, "No tienes los ethers suficientes");
        //Devolvemos cambio en caso de que pague de mas
        uint returnValue = msg.value - coste;
        // Disney retorna la cantidad de ethers al cliente
        payable(msg.sender).transfer(returnValue);
        // Obtencion del numero de tokens disponibles
        uint balance = balanceOf();
        require(_numTokens <= balance, "Compra menos tokens");
        //Se transfiere el numero de tokens al cliente
        token.transfer(msg.sender,_numTokens);
        //Registro de tokens comprados
        Clientes[msg.sender].tokens_comprados += _numTokens;
    }
    
    //Function para detectar el jnumero de tokens disponibles del contrato

    function balanceOf () public view returns(uint){
        return token.balanceOf(address(this)); //Con this le pasamos la direccion del contrato
    }

    //Balance de tokens restantes de un cliente
    function MisTokens() public view returns(uint){
        return token.balanceOf(msg.sender);
    }

    //Modificador para que chequee que sea disney
    modifier Unicamente(address _address){
        require(_address == owner,"No sos disney, tomatela");
        _;
    }
    //Funcion para generar mas tokens
    function incrementarTokens(uint _numTokens) public Unicamente(msg.sender){
        token.increaseTotalSupply(_numTokens);

    }

    //------------------- Gestion de Disney -----------------//

}