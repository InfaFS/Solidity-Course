pragma solidity ^0.4.0;
pragma experimental ABIEncoderV2;

/*
Toni | 20 | 12345X
Alberto | 23 | 23155K
Joan | 21 | 972318P


*/


contract votacion{

    //Direccion del propietario del contrato

    address public owner;

    constructor () public {
        owner = msg.sender;
    }

    mapping (string => bytes32) ID_candidatos;

    //Para ver el numero de votos del candiuadto hacemos un mapping del nombre y del numero de votos
    mapping(string => uint) votos_Candidato;

    //Lista para almacenar los nombres de los candidatos
    string [] candidatos;

    //Lista de los votantes, para ver si la persona ya voto
    bytes32 [] votantes;

    //Modificador para que una misma persona no vote varias veces

    modifier onlyGoverment(address _address){
        require(_address == owner,"No puedes ver los votos si no eres el gobernador");
        _;
    }


    function presentarCandidato(string memory _nom,uint _edad,string memory _id) public {

        //Hash de los datos del candidato
        bytes32 hash_candidato = keccak256(abi.encodePacked(_nom,_edad,_id));
        candidatos.push(_nom);
        ID_candidatos[_nom] = hash_candidato;
    }

    function verCandidatos() public view returns(string [] memory){
        return candidatos;
    }

    function votarCandidato(string memory _nombreCandidato) public {
        bytes32 hash_votante = keccak256(abi.encodePacked(msg.sender));

        for (uint i =0; i<votantes.length;i++){
            require(votantes[i]!=hash_votante,"No esta permitido votar mas de una vez");
        }
        votos_Candidato[_nombreCandidato]++;
        votantes.push(hash_votante);
    }

    function verVotos(string memory _candidato) public onlyGoverment(msg.sender) returns (uint){
        return votos_Candidato[_candidato];
    }


    //Funcion auxiliar que transforma un uint a un string

    function uint2str(uint _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len - 1;
        while (_i != 0) {
            bstr[k--] = byte(uint8(48 + _i % 10));
            _i /= 10;
        }
        return string(bstr);
    }
    
    function verResultados() public view returns(string memory){
        string memory resultados;
        for (uint _i=0;_i<candidatos.length;_i++){
            resultados = string(abi.encodePacked(resultados,"(",candidatos[_i]," | ",uint2str(verVotos(candidatos[_i])), ") ------"));
        }
    return resultados;
    }

    function ganadorVotaciones() public view returns(string memory){
        string memory ganador = candidatos[0];
        uint mayorVotos = 0;
        bool flag;
        for (uint _i=1;_i<candidatos.length;_i++){
            if (votos_Candidato[candidatos[_i]] > mayorVotos){
                mayorVotos = votos_Candidato[candidatos[_i]];
                ganador = candidatos[_i];
                flag = false;
            } else if(mayorVotos == votos_Candidato[candidatos[_i]]){
                flag = true;
            }
        }

        if (flag==true){
            ganador = "Hay empate";
        }
        return ganador;
    }

}