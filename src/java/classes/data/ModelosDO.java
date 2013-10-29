package classes.data;

/**
 *
 * @author Eduardo
 */
public class ModelosDO {
    private int _id;
    private int _ano;
    private String _modelo;
    private String _marca;
    
    public int getId() {
        return _id;
    } // getId
    
    public void setId(int id) {
        _id = id;
    } // setId
    
    public int getAno() {
        return _ano;
    } // getAno
    
    public void setAno(int ano) {
        _ano = ano;
    } // setAno
    
    public String getModelo(){
        return _modelo;
    } // getModelo
    
    public void setModelo(String modelo){
        _modelo = modelo;
    } // setEstado
    
    public String getMarca(){
        return _marca;
    } // getMarca
    
    public void setMarca(String marca){
        _marca = marca;
    } // setMarca
}
