//Indicamos la version
pragma solidity >=0.4.4 <0.7.0;

contract funciones_globales {
    //Funcion msg.sender
    function MsgSender() public view returns (address) {
        return msg.sender;
    }

    //function now
    function Now() public view returns (uint) {
        return now;
    }

    //funcion block.coibase
    function BlockCoinbase() public view returns (address) {
        return block.coinbase;
    }

    //function block.difficulty
    function BlockDifficulty() public view returns (uint) {
        return block.difficulty;
    }

    //function block.number
    function BlockNumber() public view returns (uint) {
        return block.number;
    }

    //function msg.sig
    function MsgSig() public view returns (bytes4) {
        return msg.sig;
    }

    //function tx.gasprice
    function txGasPrice() public view returns (uint) {
        return tx.gasprice;
    }
}
