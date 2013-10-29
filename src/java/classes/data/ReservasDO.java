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
    private Date _dataDeReserva = new Date();
    private String _estado;
    private Date _horarioDeDevolucao;
    
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
    
    public Date getDataDeReserva(){
        return _dataDeReserva;
    }
    
    public String getEstado(){
        return _estado;
    }
    
    public Date getHorarioDeDevolucao(){
        return _horarioDeDevolucao;
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
    
    public void setHorarioDeRetirada(String horarioDeRetirada){
        try{
            _horarioDeRetirada = hora.parse(horarioDeRetirada);
        }
        catch (ParseException e){
            System.out.println("Unable to Parse using" + hora);
        }
    }
    
    public void setDataDeReserva(String dataDeReserva){
        try{
            _dataDeReserva = data.parse(dataDeReserva);
        }
        catch (ParseException e){
            System.out.println("Unable to Parse using" + data);
        }
    }
    
    public void setEstado(String estado){
        _estado = estado;
    }
    
    public void setHorarioDeDevolucao(String HorarioDeDevolucao){
        try{
            _horarioDeDevolucao = hora.parse(HorarioDeDevolucao);
        }
        catch (ParseException e){
            System.out.println("Unable to Parse using" + hora);
        }
    }
}