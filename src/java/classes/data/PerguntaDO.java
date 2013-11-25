/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package classes.data;

/**
 *
 * @author usuario
 */


public class PerguntaDO {
    int _ID;
    int _funcionarioID;
    String _nome;
    String _email;
    String _pergunta;
    boolean _estado;
    
    public void setID(int ID){
        _ID = ID;
    }
    
    public int getID(){
        return _ID;
    }
    
    public void setNome(String nome){
        _nome = nome;         
    }
    
    public String getNome(){
        return _nome;
    }
    public void setEmail(String email){
        _email = email;         
    }
    
    public String getEmail(){
        return _email;
    }
    public void setPergunta(String pergunta){
        _pergunta = pergunta;         
    }
    
    public String getPergunta(){
        return _pergunta;
    }
    public boolean getEstado(){
        return _estado;
    }
    public void setEstado(boolean estado){
        _estado = estado;
    }
    
    public int getFuncionarioId() {
        return _funcionarioID;
    } 
    
    public void setFuncionarioId(int funcionarioID) {
        _funcionarioID = funcionarioID;
    }
    
}
