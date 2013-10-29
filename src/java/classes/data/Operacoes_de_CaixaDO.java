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
public class Operacoes_de_CaixaDO {
    
    private int _id;
    private float _valorDoPagamento;
    private Date _dataDoPagamento;
    private int _usuario_id;
    
    SimpleDateFormat data = new SimpleDateFormat ("dd/MM/yyyy");
    
    public int getID(){
        return _id;
    }
    
    public float getValorDoPagamento(){
        return _valorDoPagamento;
    }
    
    public Date getDataDoPagamento(){
        return _dataDoPagamento;
    }
    
    public int getUsuarioID(){
        return _usuario_id;
    }
    
    public void setID(int id){
        _id = id;
    }
    
    public void setValorDoPagamento(float valorDoPagamento){
        _valorDoPagamento = valorDoPagamento;
    }
    
    public void setDataDoPagamento(String dataDoPagamento){
        try{
            _dataDoPagamento = data.parse(dataDoPagamento);
        }
        catch (ParseException e){
            System.out.println("Unable to Parse using" + data);
        }
    }
    
    public void setUsuarioID(int UsuarioID){
        _usuario_id = UsuarioID;
    }
    
}
