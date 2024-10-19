pragma solidity >=0.4.4 < 0.7.0;
pragma experimental ABIEncoderV2;

//Teniendo por ejemplo
/*
--------------------------
ALUMNO | ID | NOTA
Marcos  77755N 5
Joan    12345X 9
Maria 02468t   2

etc...
*/

contract notas {

    //Direccion del profesor
    address public profesor;

    constructor () public {
        profesor = msg.sender; //La direccion del profesor sera la direccion que despliegue el contrato en la blockchain
    }

    //Mapping para relacionar el hash de la identidad del alumno con su nota del examen
    mapping (bytes32 => uint) Notas;
    mapping (string => address) direccionesAlumnos;

    //Array de los alumnos que pidan revisiones de examen
    string [] revisiones;

    //Eventos
    event alumno_evaluado(bytes32,uint);
    event evento_revision(string);
    event alumnoPresentado(string);
    //Funcion que carga la direccion del alumno en el mapp
    function presentarseMesa (string memory _idAlumno) public {
        direccionesAlumnos[_idAlumno] = msg.sender;
        emit alumnoPresentado(_idAlumno);
    }

    //Realiza control de las funciones ejecutables por el profesor 
    modifier OnlyTeacher(address _address) {
        require(_address == profesor,"No puedes corregir si no eres el profesor");
        _;
    }

    //Modificador para que solo puedan ver la nota el alumno o el profesor
    modifier OnlyTeacherOrStudent(address _address, string memory _idAlumno){
        require(_address == profesor || _address == direccionesAlumnos[_idAlumno],"No tienes los permisos para ver la nota");
        _;
    }

    //Modificador para que no pueda pedir una revision un alumno si no es el que realizo la presentacion
    modifier onlyStudent(address _address, string memory _idAlumno){
        require(_address == direccionesAlumnos[_idAlumno],"No puedes realizar la operacion de otro alumno!");
        _;
    }

    //Funcion para evaluar a alumnos
    function Evaluar(string memory _idAlumno,uint _nota) public OnlyTeacher(msg.sender) {
        //Hash de la identificacion del alumno
        bytes32 hash_idAlumno = keccak256(abi.encodePacked(_idAlumno));
        //Relacion entre el hash de la identificacion del alumno y las notas
        Notas[hash_idAlumno] = _nota;
        //Emision del evento
        emit alumno_evaluado(hash_idAlumno,_nota);
    }



    //Funcion para visualizar las notas
    function VisualizarNota(string memory _idAlumno) public view OnlyTeacherOrStudent(msg.sender,_idAlumno) returns(uint) {
        bytes32 hash_Alumno = keccak256(abi.encodePacked(_idAlumno));
        return Notas[hash_Alumno]; 
    }

    //Funcion para pedir una revision del examen
    function Revision(string memory _idAlumno) public onlyStudent(msg.sender,_idAlumno){
        //Almacenamos la identidad del alumno en un array
        revisiones.push(_idAlumno);
        emit evento_revision(_idAlumno);
    }

    //Funcion para ver todas las revisiones que tiene el profesor
    function VerRevisiones() public view OnlyTeacher(msg.sender) returns (string [] memory){
        return revisiones;
        // string memory [] pedidos;
        // if(revisiones.length == 0){
        //     pedidos.push("No hay pedidos");
        //     return pedidos;
        // } else
    }
}