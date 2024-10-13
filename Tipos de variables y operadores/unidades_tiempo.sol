//indica version
pragma solidity >=0.4.4 <0.7.0;

contract tiempo {

    uint public minute = 1 minutes; 
    //en unix time
    uint public tiempo_actual = now;
    uint public two_hours = 2 hours;
    uint public dias = 50 days;
    uint public week = 1 weeks;
    
    function MasSegundos() public view returns(uint){
        return now + 50 seconds;
    }

    function MasHoras() public view returns(uint){
        return now + 1 hours;
    }

    function retornarNow() public view returns(uint){
        return now;
    }
}