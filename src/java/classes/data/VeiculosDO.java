package classes.data;

/**
 *
 * @author Eduardo
 */
public class VeiculosDO {
    private int _id;
    private int _quilometragem;
    private boolean _arCondicionado;
    private boolean _direcaoHidraulica;
    private boolean _freioABS;
    private boolean _GPS;
    private boolean _cambioAutomatico;
    private String _estado;
    private String _placa;
    private int _modeloID;
    private int _vagaID;
    private int _clienteID;
    private int _estacionamentoID;
    
    public int getId() {
        return _id;
    } // getId
    
    public void setId(int id) {
        _id = id;
    } // setId
    
    public int getQuilometragem(){
        return _quilometragem;
    } // getQuilometragem
    
    public void setQuilometragem(int quilometragem){
        _quilometragem = quilometragem;
    } // setQuilometragem
    
    public boolean getArCondicionado(){
        return _arCondicionado;
    } // getArCondicionado
    
    public void setArCondicionado(boolean arCondicionado){
        _arCondicionado = arCondicionado;
    } // setArCondicionado
    
    public boolean getDirecaoHidraulica(){
        return _direcaoHidraulica;
    } // getDirecaoHidraulica
    
    public void setDirecaoHidraulica(boolean direcaoHidraulica){
        _direcaoHidraulica = direcaoHidraulica;
    } // setDirecaoHidraulica
    
    public boolean getFreioABS(){
        return _freioABS;
    } //getFreioABS
    
    public void setFreioABS(boolean freioABS){
        _freioABS = freioABS;
    } // setFreioABS
    
    public boolean getGPS(){
        return _GPS;
    } // getGPS
    
    public void setGPS(boolean GPS){
        _GPS = GPS;
    } // setGPS
    
    public boolean getCambioAutomatico(){
        return _cambioAutomatico;
    } // getCambioAutomatico
    
    public void setCambioAutomatico(boolean cambioAutomatico){
        _cambioAutomatico = cambioAutomatico;
    } // setCambioAutomatico
    
    public String getEstado(){
        return _estado;
    } // getEstado
    
    public void setEstado(String estado){
        _estado = estado;
    } // setEstado
    
    public String getPlaca(){
        return _placa;
    } // getPlaca
    
    public void setPlaca(String placa){
        _placa = placa;
    } // setPlaca
    
    public int getModeloID(){
        return _modeloID;
    } // getModeloID
    
    public void setModeloID(int modeloID){
        _modeloID = modeloID;
    } // setModeloID
    
    public int getVagaID(){
        return _vagaID;
    } // getEstacionamentoID
    
    public void setVagaID(int vagaID){
        _vagaID = vagaID;
    } // setEstacionamentoID
    
    public int getClienteID(){
        return _clienteID;
    } // getEstacionamentoID
    
    public void setClienteID(int clienteID){
        _clienteID = clienteID;
    } // setEstacionamentoID
    
    public int getEstacionamentoID(){
        return _estacionamentoID;
    } // getEstacionamentoID
    
    public void setEstacionamentoID(int estacionamentoID){
        _estacionamentoID = estacionamentoID;
    } // setEstacionamentoID
}
