package classes.data;

public class ClientesDO {
    private int _id;
    private int _usuarioID;
    private String _nome;
    private String _CPF;
    private String _email;
    private String _endereco;
    private String _telefone;
    private String _CNH;
    private String _estado;
   
    public int getId() {
        return _id;
    } // getId
    
    /** Set ID do Cliente

     * @param  id int - ID do cliente.

     */

    public void setId(int id) {
        _id = id;
    } // setId
    
    public int getUsuarioId() {
        return _usuarioID;
    } 
    
    public void setUsuarioId(int usuarioID) {
        _usuarioID = usuarioID;
    }
 
    public String getNome() {
        return _nome;
    } 
    
    public void setNome(String nome) {
        _nome = nome;
    }
    
    public String getCPF() {
        return _CPF;
    } 
    
    public void setCPF(String CPF) {
        _CPF = CPF;
    }  
    
    public String getEmail() {
        return _email;
    } 
    
    public void setEmail(String email) {
        _email = email;
    }
    
    public String getEndereco() {
        return _endereco;
    } 
    
    public void setEndereco(String endereco) {
        _endereco = endereco;
    }   
    
    public String getTelefone() {
        return _telefone;
    } 
    
    public void setTelefone(String telefone) {
        _telefone = telefone;
    }    
    
    public String getCNH() {
        return _CNH;
    } 
    
    public void setCNH(String CNH) {
        _CNH = CNH;
    }
    
    public String getEstado() {
        return _estado;
    } 
    
    public void setEstado(String estado) {
        _estado= estado;
    }
}
