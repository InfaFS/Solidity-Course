pragma solidity >=0.4.4 <0.7.0;

contract causasBeneficas {

    struct Causa{
        uint id;
        string name;
        uint precio_objetivo;
        uint cantidad_recaudada;
    }

    uint contador_causas = 0;

    //Relaciona el nombre de la causa con la causa (tipo complejo)
    mapping (string => Causa) causas;

    //Dar de alta una causa
    function nuevaCausa(string memory _name,uint _precio_objetivo) public  payable{
        contador_causas++;
        Causa memory causa = Causa(contador_causas,_name,_precio_objetivo,0);
        causas[_name] = causa;
    }

    //Funcion para ver si se le puede o no doanr a una causa
    function objetivoCumplido(string memory _causa,uint _donar) private view returns (bool){
        bool flag = false;
        Causa memory causaBuscada = causas[_causa];
        if((causaBuscada.cantidad_recaudada +_donar) <= causaBuscada.precio_objetivo){
            flag = true;
        } 
        return flag;

    }

    //Donar a una causa
    function donar(string memory _nombre, uint _cantidad) public returns(bool){
        bool aceptarDonacion = objetivoCumplido(_nombre, _cantidad);
        if (aceptarDonacion){
            causas[_nombre].cantidad_recaudada += _cantidad;
        }
        return aceptarDonacion;
    }

    //Funcion para ver si se alcanzo el limite de una causa
    function comprobar_causa(string memory _causa) public view returns(bool,uint){
        
        bool limite_alcanzado = false;
        Causa memory causa = causas[_causa];
        if (causa.cantidad_recaudada >= causa.precio_objetivo){
            limite_alcanzado = true;
        }
        return (limite_alcanzado,causa.cantidad_recaudada);
    }
}