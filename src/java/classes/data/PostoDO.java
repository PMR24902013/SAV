/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.data;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author hidden
 */
public class PostoDO {

    private int _id;
    private int _usuariosid;
    private String _nome;
    private String _endereco;
    private String _telefone;
    private String _horarioDeFuncionamento;
    private String _responsavel;
    private String _documentoDeLicenciamento;
    private String _estado;
    private String _gasolina;
    private String _alcool;

    public int getID() {
        return _id;
    }

    public int getUsuariosID() {
        return _usuariosid;
    }

    public String getNome() {
        return _nome;
    }

    public String getEndereco() {
        return _endereco;
    }

    public String getTelefone() {
        return _telefone;
    }

    public String getHorario() {
        return _horarioDeFuncionamento;
    }

    public String getResponsavel() {
        return _responsavel;
    }

    public String getDocumento() {
        return _documentoDeLicenciamento;
    }
    
    public String getEstado() {
        return _estado;
    } 
    
    public String getGasolina() {
        return _gasolina;
    }

    public String getAlcool() {
        return _alcool;
    }
    
    public void setID(int id) {
        _id = id;
    }

    public void setUsuariosID(int id) {
        _usuariosid = id;
    }

    public void setNome(String nome) {
        _nome = nome;
    }

    public void setEndereco(String end) {
        _endereco = end;
    }

    public void setTelefone(String tel) {
        _telefone = tel;
    }

    public void setHorario(String hor) {
        _horarioDeFuncionamento = hor;
    }

    public void setResponsavel(String resp) {
        _responsavel = resp;
    }

    public void setDocumento(String doc) {
        _documentoDeLicenciamento = doc;
    }
    
    
    public void setEstado(String estado) {
        _estado= estado;
    }
    
    public void setGasolina (String gasolina) {
        _gasolina = gasolina;
    }
    
    public void setAlcool (String alcool){
        _alcool = alcool;
    }

}
