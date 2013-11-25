/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.data;

import java.util.*;
import java.text.*;

/**
 *
 * @author User
 */
public class ReservasDO {
    
    private int _id;
    private int _vaga_id;
    private int _operacoesDeCaixa_id;
    private int _modelo_id;
    private int _veiculo_id;
    private int _estacionamento_id;
    private int _cliente_id;
    private Date _horarioDeRetirada;
    private Date _dataDeReserva;
    private Date _horarioDeDevolucao;
    private String _estado;
    
    SimpleDateFormat data = new SimpleDateFormat ("dd/MM/yyyy");
    SimpleDateFormat hora = new SimpleDateFormat ("hh:mm");
    
    public int getID(){
        return _id;
    }
    
    public int getVagaID(){
        return _vaga_id;
    }
    
    public int getOperacoesDeCaixaID(){
        return _operacoesDeCaixa_id;
    }
    
    public int getModeloID(){
        return _modelo_id;
    }
    
    public int getVeiculoID(){
        return _veiculo_id;
    }
    
    public int getEstacionamentoID(){
        return _estacionamento_id;
    }
    
    public int getClienteID(){
        return _cliente_id;
    }
    
    public Date getHorarioDeRetirada(){
        return _horarioDeRetirada;
    }
    
    public Date getHorarioDeDevolucao(){
        return _horarioDeDevolucao;
    }
    
    
    public Date getDataDeReserva(){
        return _dataDeReserva;
    }
    
    public String getEstado(){
        return _estado;
    }
    
    public void setID(int id){
        _id = id;
    }
    
    public void setVagaID(int idVaga){
        _vaga_id = idVaga;
    }
    
    public void setOperacoesDeCaixaID(int idOperacoesDeCaixa){
        _operacoesDeCaixa_id = idOperacoesDeCaixa;
    }
    
    public void setModeloID(int idModelo){
        _modelo_id = idModelo;
    }
    
    public void setVeiculoID(int idVeiculo){
        _veiculo_id = idVeiculo;
    }
    
    public void setEstacionamentoID(int idEstacionamento){
        _estacionamento_id = idEstacionamento;
    }
    
    public void setClienteID(int idCliente){
        _cliente_id = idCliente;
    }
    
    public void setHorarioDeRetirada(Date horarioDeRetirada){
            _horarioDeRetirada = horarioDeRetirada;
    }
    
    public void setHorarioDeDevolucao(Date horarioDeDevolucao){
            _horarioDeDevolucao = horarioDeDevolucao;
    }
    
    public void setDataDeReserva(Date dataDeReserva){
            _dataDeReserva = dataDeReserva;
    }
    
    public void setEstado(String estado){
        _estado = estado;
    }
   
}
