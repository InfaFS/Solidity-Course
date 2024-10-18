pragma solidity >=0.4.4 < 0.7.0;

contract Comida {
    struct plato{
        string nombre;
        string ingredientes;
        uint tiempo;
    }

    plato [] platos;

    //Relaciona el nombre del plato con sus ingredientes
    mapping(string => string) ingredientes;

    function nuevoPlato(string memory _nombre, string memory _ingredientes, uint _tiempo) internal {
        platos.push(plato(_nombre,_ingredientes,_tiempo));
        ingredientes[_nombre] = _ingredientes;
    }

    function mapIngrediente(string memory _nombre) internal view returns(string memory){
        return ingredientes[_nombre];
    }

}

contract sandwich is Comida{

    function createSandwich (string memory _ingredientes, uint _tiempo) external {
        nuevoPlato("Sandwich",_ingredientes,_tiempo);
    }

    function verIngredientes(string memory _nombre_plato) external view returns(string memory){
        return mapIngrediente(_nombre_plato);
    }
}